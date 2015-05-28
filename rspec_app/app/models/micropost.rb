class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('id DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
