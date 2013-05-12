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
    @hardware     = Hardware.new
    @hardwares    = Hardware.all.map   { |h| [h.name, h.id] }
    @positions    = Position.all.map   { |p| [p.name, p.id] }
    @datacenters  = Datacenter.all.map { |d| [d.name, d.id] }

    @location_data = Datacenter.location_json

    respond_to do |format|
      format.html
      format.json { render json: @hardware }
    end
  end

  def edit
    @hardware = Hardware.find(params[:id])
  end

  def create
    @hardware = Hardware.new(params[:hardware])
    @datacenters = Datacenter.all.map { |d| [d.name, d.id] }

    respond_to do |format|
      if @hardware.save
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully created.' }
        format.json { render json: @hardware, status: :created, location: @hardware }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        format.html { redirect_to hardwares_path, notice: 'Hardware was successfully updated.' }
        format.json { head :no_content }
      else
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
