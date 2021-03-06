class Post < ApplicationRecord

	validates :title, presence: true, length: { minimum: 5}
	validates :description, presence: true, length: { maximum: 300}

	belongs_to :user

	extend FriendlyId
    friendly_id :title, use: :slugged

end
