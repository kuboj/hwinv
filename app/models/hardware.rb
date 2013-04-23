class Hardware < ActiveRecord::Base
  attr_accessible :name, :parent_hardware_id, :position_id
  has_many   :parts,
             foreign_key: :parent_hardware_id,
             class_name:  to_s
  belongs_to :parent_hardware,
             class_name:  to_s
end
