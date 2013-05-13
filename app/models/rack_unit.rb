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
  has_many   :locations
  has_many   :hardwares, through: :locations

  validates :server_rack_id, presence: true
  validates :row_number,     presence: true

  def occupied_text
    if self.hardwares.empty?
      'free'
    else
      "occupied by #{self.hardwares.size} pcs of hw"
    end
  end
end
