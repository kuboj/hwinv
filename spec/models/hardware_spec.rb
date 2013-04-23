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

require 'spec_helper'

describe Hardware do
  pending "add some examples to (or delete) #{__FILE__}"
end
