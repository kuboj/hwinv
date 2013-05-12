# == Schema Information
#
# Table name: hardwares
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  parent_hardware_id :integer
#  position_id        :integer
#  created_at         :datetime         not null
#

class Hardware < ActiveRecord::Base
  attr_accessible :name, :parent_hardware_id, :position_id
  has_many   :parts,
             foreign_key: :parent_hardware_id,
             class_name:  to_s
  has_many   :locations
  belongs_to :parent_hardware,
             class_name:  to_s
  validates :name, presence:   true,
                   length:     { maximum: 100 },
                   uniqueness: { case_sensitive: false }
  before_save { |hardware| hardware.email = hardware.downcase }
end