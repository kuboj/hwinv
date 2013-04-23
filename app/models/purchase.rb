class Purchase < ActiveRecord::Base
  attr_accessible :currency, :hardware_id, :name, :price, :purchased_at, :warranty_until
end
