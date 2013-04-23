# == Schema Information
#
# Table name: server_racks
#
#  id            :integer          not null, primary key
#  name          :string(45)       not null
#  datacenter_id :integer          not null
#  created_at    :datetime         not null
#

class ServerRack < ActiveRecord::Base
  attr_accessible :datacenter_id, :name
  #attr_accessor :rack_units_count
  belongs_to :datacenter
  has_many   :rack_units,   dependent: :destroy

  validates :name,          presence: true, uniqueness: true
  validates :datacenter_id, presence: true
end
