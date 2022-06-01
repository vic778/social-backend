class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :description, :video, :user_id, :created_at, :updated_at
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
