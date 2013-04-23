# == Schema Information
#
# Table name: rack_units
#
#  id             :integer          not null, primary key
#  server_rack_id :integer          not null
#  row_number     :integer          not null
#  created_at     :datetime         not null
#

class RackUnit < ActiveRecord::Base
  attr_accessible :row_number, :server_rack_id
  belongs_to :server_rack
  has_many :hardwares, through: :locations
end
