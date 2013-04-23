# == Schema Information
#
# Table name: locations
#
#  id           :integer          not null, primary key
#  hardware_id  :integer          not null
#  rack_unit_id :string(45)       not null
#  created_at   :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :hardware_id, :rack_unit_id
  belongs_to :hardware
  belongs_to :rack_unit
end
