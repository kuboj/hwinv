# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  name       :string(45)       not null
#  created_at :datetime         not null
#

class Key < ActiveRecord::Base
  attr_accessible :name
  has_many :parameters
end
