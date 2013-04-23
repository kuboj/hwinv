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
end
