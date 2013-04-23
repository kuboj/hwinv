class Parameter < ActiveRecord::Base
  attr_accessible :hardware_id, :key_id, :value
  belongs_to :hardware
  belongs_to :key
end
