class Datacenter < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :server_racks
end
