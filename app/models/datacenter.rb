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
  has_many  :server_racks

  validates :address, presence: true
  validates :name,    presence: true
end
