class HardwareType < ActiveRecord::Base
  attr_accessible :name

  validates :name,
            presence: true,
            length:   { maximum: 50 },
            uniqueness: { case_sensitive: false }
  before_save { |hwtype| hwtype.name.downcase! }
end
