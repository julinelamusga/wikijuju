class Wiki < ActiveRecord::Base
  attr_accessible :name
  has_many :pages
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
