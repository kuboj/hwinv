# == Schema Information
#
# Table name: server_racks
#
#  id            :integer          not null, primary key
#  name          :string(45)       not null
#  datacenter_id :integer          not null
#  created_at    :datetime         not null
#

require 'spec_helper'

describe ServerRack do
  pending "add some examples to (or delete) #{__FILE__}"
end
