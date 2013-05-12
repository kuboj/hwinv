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

class Purchase < ActiveRecord::Base
  attr_accessible :currency, :hardware_id, :name, :price, :purchased_at, :warranty_until

  validates :currency, presence: true
  validates :hardware_id, presence: true
  validates :name, presence:   true,
                   length:     { maximum: 100 },
                   uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates :purchased_at, presence: true
  validates :warranty_until, presence: true
end
