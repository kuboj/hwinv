# == Schema Information
#
# Table name: datacenters
#
#  id         :integer          not null, primary key
#  address    :string(200)      not null
#  name       :string(45)       not null
#  created_at :datetime         not null
#

require 'spec_helper'

describe Datacenter do
  pending "add some examples to (or delete) #{__FILE__}"
end
