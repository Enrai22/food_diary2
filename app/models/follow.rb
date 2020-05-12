class Follow < ApplicationRecord
  validates :user_id, {presence: true}
  validates :folloe_user_id, {presence: true}
end
