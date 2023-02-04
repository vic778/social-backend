class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # after_create :set_image_url

  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :image, presence: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # set the host for the image url

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
