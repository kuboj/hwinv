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
  attr_accessible :datacenter_id, :name, :rack_units_count
  attr_accessor   :rack_units_count

  belongs_to :datacenter
  has_many   :rack_units, dependent: :destroy

  validates :name,             presence: true, uniqueness: true
  validates :datacenter_id,    presence: true
  validates :rack_units_count, presence: true

  after_save :update_rack_units

  def update_rack_units
    if self.id.nil?
      self.rack_units_count.times { |i| self.rack_units.create(row_number: i + 1) }
    else
      old_count = ServerRack.find(self.id).rack_units.count
      new_count = self.rack_units_count.to_i
      if new_count > old_count
        (new_count - old_count).times do |i|
          self.rack_units.create(row_number: old_count + i + 1)
        end
      elsif new_count < old_count
        (old_count - new_count).times do |i|
          self.rack_units.find_by_row_number(new_count + i + 1).destroy
        end
      end
    end
  end
end
