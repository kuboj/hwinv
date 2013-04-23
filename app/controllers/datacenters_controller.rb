class DatacentersController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  def index
    @datacenters = Datacenter.all

    respond_to do |format|
      format.html
      format.json { render json: @datacenters }
    end
  end

  #def show
  #  @datacenter = Datacenter.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @datacenter }
  #  end
  #end

  def new
    @datacenter = Datacenter.new

    respond_to do |format|
      format.html
      format.json { render json: @datacenter }
    end
  end

  def edit
    @datacenter = Datacenter.find(params[:id])
  end

  def create
    @datacenter = Datacenter.new(params[:datacenter])

    respond_to do |format|
      if @datacenter.save
        format.html { redirect_to datacenters_path, notice: 'Datacenter was successfully created.' }
        format.json { render json: @datacenter, status: :created, location: @datacenter }
      else
        format.html { render action: "new" }
        format.json { render json: @datacenter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @datacenter = Datacenter.find(params[:id])

    respond_to do |format|
      if @datacenter.update_attributes(params[:datacenter])
        format.html { redirect_to datacenters_path, notice: 'Datacenter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datacenter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @datacenter = Datacenter.find(params[:id])
    @datacenter.destroy

    respond_to do |format|
      format.html { redirect_to datacenters_url, notice: 'Datacenter was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
