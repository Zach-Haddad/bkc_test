class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fname, :lname, :email, presence: true

  has_many :posts, inverse_of: :author
  has_many :comments, inverse_of: :author
end
