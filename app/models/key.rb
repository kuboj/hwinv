class Key < ActiveRecord::Base
  attr_accessible :name
  has_many :parameters
end
