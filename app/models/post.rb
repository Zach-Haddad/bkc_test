class Post < ActiveRecord::Base
  validates :body, :author, :title, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :posts
  )

  has_many :comments, inverse_of: :post
  self.per_page = 10
end
