class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id
  belongs_to :user
  belongs_to :post
end
