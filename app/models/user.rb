class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  validates :name, presence: true

  has_many :wikis
  has_many :pages
  has_many :collaborations

  def public_wikis
    Wiki.users_public_wikis(id)
  end

  def private_wikis
    Wiki.users_private_wikis(id)
  end
end