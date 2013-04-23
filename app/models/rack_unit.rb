class RackUnit < ActiveRecord::Base
  attr_accessible :row_number, :server_rack_id
  belongs_to :server_rack
  has_many :hardwares, through: :locations
end
