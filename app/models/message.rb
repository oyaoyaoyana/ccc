class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :group_id, presence: true
  validates :body, presence: true, unless: :image?
end

