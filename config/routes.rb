Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
