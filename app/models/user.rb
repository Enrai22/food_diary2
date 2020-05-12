class User < ApplicationRecord
  valid_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, {presence: true, length: {maximum:10}}
  validates :email, {presence: true, uniqueness: true, format: {with:valid_email}}
  validates :password, {presence: true, length:{minimum:4}}
  mount_uploader :image, ImageUploader

  def posts
    return Post.where(user_id: self.id)
  end
end
