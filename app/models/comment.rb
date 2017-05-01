class Comment < ActiveRecord::Base
  validates :body, :author, :post, presence: true

  belongs_to :post, inverse_of: :comments

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :comments
  )

  self.per_page = 10
end
