class Location < ActiveRecord::Base
  attr_accessible :hardware_id, :rack_unit_id
  belongs_to :hardware
  belongs_to :rack_unit
end
