# == Schema Information
#
# Table name: locations
#
#  id           :integer          not null, primary key
#  hardware_id  :integer          not null
#  rack_unit_id :string(45)       not null
#  created_at   :datetime         not null
#

require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
end
