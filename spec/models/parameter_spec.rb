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

require 'spec_helper'

describe Parameter do
  pending "add some examples to (or delete) #{__FILE__}"
end
