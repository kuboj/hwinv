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

class Hardware < ActiveRecord::Base
  attr_accessible :name, :parent_hardware_id, :position_id
  attr_accessor   :datacenter_id, :server_rack_id, :rack_unit_ids, :currency, :purchase_name,
                  :price, :purchased_at, :warranty_until, :key_ids, :values

  has_many   :parts,
             foreign_key: :parent_hardware_id,
             class_name:  to_s
  has_many   :locations,  dependent: :destroy
  has_many   :parameters, dependent: :destroy
  belongs_to :parent_hardware,
             class_name:  to_s
  validates :name, presence:   true,
                   length:     { maximum: 100 },
                   uniqueness: { case_sensitive: false }
  validate :location_valid
  after_save :create_location_entry
  after_save :create_purchase
  after_save :create_parameters
  after_destroy :destroy_purchase

  def purchase
    Purchase.find_by_hardware_id(self.id)
  end

  def has_purchase?
    !!Purchase.find_by_hardware_id(self.id)
  end

  def add_parameters(key_ids, values)
    self.key_ids = key_ids
    self.values  = values
  end

  def add_parent(data)
    @location               = :parent
    self.parent_hardware_id = data[:parent_hardware_id].to_i
    self.position_id        = data[:position_id].to_i
  end

  def add_location(data)
    @location           = :physical
    self.datacenter_id  = data[:datacenter_id]
    self.server_rack_id = data[:server_rack_id]
    self.rack_unit_ids  = data[:rack_unit_ids]
  end

  def create_location_entry
    return unless @location == :physical
    @rack_unit_ids.each do |id|
      Location.create(rack_unit_id: id, hardware_id: self.id)
    end
  end

  def add_purchase(data)
    @purchase = true
    self.currency       = data[:currency]
    self.purchase_name  = data[:purchase_name]
    self.price          = data[:price]
    self.purchased_at   = data[:purchased_at]
    self.warranty_until = data[:warranty_until]
  end

  def create_purchase
    return unless @purchase
    Purchase.create(
        hardware_id:    self.id,
        currency:       self.currency,
        name:           self.purchase_name,
        price:          self.price,
        purchased_at:   self.purchased_at,
        warranty_until: self.warranty_until
    )
  end

  def create_parameters
    self.key_ids.each_index do |i|
      Parameter.create(
          hardware_id: self.id,
          key_id:      self.key_ids[i],
          value:       self.values[i]
      )
    end
  end

  def destroy_purchase
    if (p = Purchase.find_by_hardware_id(self.id))
      p.destroy
    end
  end

  private
  def location_valid
    if @location == :parent
      errors.add(:parent_hardware_id, 'does not exist') unless Hardware.exists?(self.parent_hardware_id)
      errors.add(:position_id, 'does not exist') unless Position.exists?(self.position_id)
    elsif @location == :physical
      errors.add(:datacenter_id, 'does not exist') unless Datacenter.exists?(self.datacenter_id)
      errors.add(:server_rack_id, 'does not exist') unless ServerRack.exists?(self.server_rack_id)
      errors.add(:rack_unit_ids, 'do not exist') unless (self.rack_unit_ids ||= []).all? { |id| RackUnit.exists?(id) }
    else
      errors.add( 'Location must be set')
    end
  end
end