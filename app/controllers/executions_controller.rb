class ExecutionsController < ApplicationController

  before_action :find_execution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @executions = Execution.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def new
    @execution = Execution.new
  end

  def create
  	@execution = Execution.new(execution_params)
      if @execution.save
        flash[:notice] = "Dodałeś realizację"
        redirect_to execution_path(@execution)
      else
        render 'new'
      end
  end

  def show
  end

  def edit
  end

  def update
	  if  @execution.update(execution_params)
      flash[:notice] = "Zaktualizowałeś realizację"
	    redirect_to execution_path(@execution)
	  else
		  render 'edit'
	  end
  end

  def destroy
    @execution.destroy
    flash[:alert] = "Usunąłeś realizację"
    redirect_to executions_path
  end


  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: executions_path)
  end

  private

  def execution_params
    params.require(:execution).permit(:name,:description, :user_id, images: [])

  end

  def find_execution
    @execution = Execution.friendly.find(params[:id])
  end

end
