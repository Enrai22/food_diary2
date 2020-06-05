class Follow < ApplicationRecord
  validates :user_id, {presence: true}
  validates :follow_user_id, {presence: true}
end
