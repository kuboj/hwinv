# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  name           :string(100)      not null
#  purchased_at   :date             not null
#  warranty_until :date             not null
#  price          :float            not null
#  currency       :string(5)        not null
#  hardware_id    :integer          not null
#  created_at     :datetime         not null
#

require 'spec_helper'

describe Purchase do
  pending "add some examples to (or delete) #{__FILE__}"
end
