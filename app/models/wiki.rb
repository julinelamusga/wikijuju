class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  attr_accessible :name, :premium
  has_many :pages
  has_many :collaborations
  has_many :users, through: :collaborations
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.all_public
    where(premium: false)
  end

  def self.users_public_wikis(user_id)
    where(user_id: user_id, premium: false)
  end

  def self.users_private_wikis(user_id)
    where(user_id: user_id, premium: true)
  end
end
