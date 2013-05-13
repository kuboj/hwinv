class HardwaresController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  #def index
  #  @hardwares = Hardware.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @hardwares }
  #  end
  #end
  #
  #def show
  #  @hardware = Hardware.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @hardware }
  #  end
  #end

  def new
    @hardware      = Hardware.new
    @hardwares     = Hardware.all.map   { |h| [h.name, h.id] }
    @positions     = Position.all.map   { |p| [p.name, p.id] }
    @datacenters   = Datacenter.all.map { |d| [d.name, d.id] }
    @keys          = Key.all.map { |k| [k.name, k.id] }
    @location_data = Datacenter.location_json
    @purchase = OpenStruct.new({
                    name:           '',
                    price:          '',
                    currency:       '',
                    purchased_at:   nil,
                    warranty_until: nil
                })

    respond_to do |format|
      format.html
      format.json { render json: @hardware }
    end
  end

  def edit
    @hardware      = Hardware.find(params[:id])
    @hardwares     = Hardware.all.map   { |h| [h.name, h.id] }
    @positions     = Position.all.map   { |p| [p.name, p.id] }
    @datacenters   = Datacenter.all.map { |d| [d.name, d.id] }
    @keys          = Key.all.map { |k| [k.name, k.id] }
    @location_data = Datacenter.location_json
    @purchase = if @hardware.has_purchase?
                  @hardware.purchase
                else
                  OpenStruct.new({
                      name:           '',
                      price:          '',
                      currency:       '',
                      purchased_at:   nil,
                      warranty_until: nil
                  })
                end
  end

  def create
    @hardware = Hardware.new(name: params[:name])

    if params[:purchase] == 'yes'
      params[:purchased_at] = DateTime.new(
          params[:purchased_at]['date(1i)'].to_i,
          params[:purchased_at]['date(2i)'].to_i,
          params[:purchased_at]['date(3i)'].to_i
      )
      params[:warranty_until] =
          DateTime.new(
              params[:warranty_until]['date(1i)'].to_i,
              params[:warranty_until]['date(2i)'].to_i,
              params[:warranty_until]['date(3i)'].to_i
          )
      @hardware.add_purchase(params)
    end
    if params[:location] == 'parent'
      @hardware.add_parent(params)
    elsif params[:location] == 'physical'
      @hardware.add_location(params)
    end

    @hardware.add_parameters(params[:key_ids][1..-2], params[:values][1..-2])

    respond_to do |format|
      if @hardware.save
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully created.' }
        format.json { render json: @hardware, status: :created, location: @hardware }
      else
        @hardwares     = Hardware.all.map   { |h| [h.name, h.id] }
        @positions     = Position.all.map   { |p| [p.name, p.id] }
        @datacenters   = Datacenter.all.map { |d| [d.name, d.id] }
        @keys          = Key.all.map { |k| [k.name, k.id] }
        @location_data = Datacenter.location_json
        @purchase = if @hardware.has_purchase?
                      @hardware.purchase
                    else
                      OpenStruct.new({
                          name:           '',
                          price:          '',
                          currency:       '',
                          purchased_at:   nil,
                          warranty_until: nil
                      })
                    end
        format.html { render action: "new" }
        format.json { render json: @hardware.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hardware = Hardware.find(params[:id])

    if params[:purchase] == 'yes'
      params[:purchased_at] = DateTime.new(
          params[:purchased_at]['date(1i)'].to_i,
          params[:purchased_at]['date(2i)'].to_i,
          params[:purchased_at]['date(3i)'].to_i
      )
      params[:warranty_until] =
          DateTime.new(
              params[:warranty_until]['date(1i)'].to_i,
              params[:warranty_until]['date(2i)'].to_i,
              params[:warranty_until]['date(3i)'].to_i
          )
      @hardware.add_purchase(params)
    end
    if params[:location] == 'parent'
      @hardware.add_parent(params)
    elsif params[:location] == 'physical'
      @hardware.add_location(params)
    end

    @hardware.add_parameters(params[:key_ids][1..-2], params[:values][1..-2])

    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully updated.' }
        format.json { head :no_content }
      else
        @hardwares     = Hardware.all.map   { |h| [h.name, h.id] }
        @positions     = Position.all.map   { |p| [p.name, p.id] }
        @datacenters   = Datacenter.all.map { |d| [d.name, d.id] }
        @keys          = Key.all.map { |k| [k.name, k.id] }
        @location_data = Datacenter.location_json
        format.html { render action: "edit" }
        format.json { render json: @hardware.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy

    respond_to do |format|
      format.html { redirect_to hardwares_url, notice: 'Hardware was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
