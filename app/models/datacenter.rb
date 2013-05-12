# == Schema Information
#
# Table name: datacenters
#
#  id         :integer          not null, primary key
#  address    :string(200)      not null
#  name       :string(45)       not null
#  created_at :datetime         not null
#

class Datacenter < ActiveRecord::Base
  attr_accessible :address, :name
  has_many  :server_racks, dependent: :destroy

  validates :address, presence: true,
                      uniqueness: true
  validates :name,    presence:   true,
                      uniqueness: { case_sensitive: false },
                      length:     { maximum: 50 }

  def self.location_json
    out = Datacenter.all.map do |d|
      server_racks = d.server_racks.map do |r|
        rack_units = r.rack_units.map do |u|
          hardwares = u.hardwares.map do |h|
            { :id => h.id, :name => h.name }
          end
          { :id => u.id, :row_number => u.row_number, :hardwares => hardwares }
        end
        { :id => r.id, :name => r.name, :rack_units => rack_units }
      end
      { :id => d.id, :name => d.name, :server_racks => server_racks }
    end

    out.to_json
  end
end
