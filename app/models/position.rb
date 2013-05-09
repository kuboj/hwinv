# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string(45)       not null
#  created_at :datetime         not null
#

class Position < ActiveRecord::Base
  attr_accessible :name
  has_many :hardwares

  validates :name, presence:   true,
                   uniqueness: { case_sensitive: false },
                   length:     { maximum: 50 }

  before_save { |position| position.name.downcase! }
end
