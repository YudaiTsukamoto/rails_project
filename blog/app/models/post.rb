class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true

  def add_comment(content, user)
    Comment.create(commenter: user, content: content)
  end
end
