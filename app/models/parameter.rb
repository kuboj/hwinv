# == Schema Information
#
# Table name: parameters
#
#  id          :integer          not null, primary key
#  key_id      :integer          not null
#  hardware_id :integer          not null
#  value       :string(200)      not null
#  created_at  :datetime         not null
#

class Parameter < ActiveRecord::Base
  attr_accessible :hardware_id, :key_id, :value
  belongs_to :hardware
  belongs_to :key

  validates :hardware_id, presence: true
  validates :key_id,      presence: true
  validates :value,       presence: true

  validate :hardware_existence
  validate :key_existence

  def hardware_existence
    errors.add(:hardware_id, 'does not exist') unless Hardware.exists?(self.hardware_id)
  end

  def key_existence
    errors.add(:key_id, 'does not exist') unless Key.exists?(self.key_id)
  end
end
