class User < ActiveRecord::Base
  belongs_to :supply
  belongs_to :party
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
#     validates :email, presence: true, uniqueness: true
#  has_secure_password

  # attr_accessible :title, :body
end
