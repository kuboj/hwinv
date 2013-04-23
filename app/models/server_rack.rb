class ServerRack < ActiveRecord::Base
  attr_accessible :datacenter_id, :name
  belongs_to :datacenter
  has_many :rack_units
end
