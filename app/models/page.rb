class Page < ActiveRecord::Base
  attr_accessible :body, :title, :wiki
  belongs_to :wiki
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end