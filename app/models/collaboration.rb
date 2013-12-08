class Collaboration < ActiveRecord::Base
  attr_accessible :wiki_id
  belongs_to :wiki
  belongs_to :user
end
