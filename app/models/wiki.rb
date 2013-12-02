class Wiki < ActiveRecord::Base
  attr_accessible :name, :premium
  has_many :pages
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # def self.authorized(user)
  #   Possible refactor
  # end
end
