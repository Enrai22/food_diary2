class Post < ApplicationRecord
  validates :title,{presence: true, length:{maximum: 15}}
  validates :content, {presence: true, length: {maximum: 200}}
  validates :user_id, {presence: true}
  mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
