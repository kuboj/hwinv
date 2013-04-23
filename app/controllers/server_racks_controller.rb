class ServerRacksController < ApplicationController
  before_filter :signed_in_user
  before_filter :init_datacenter
  before_filter :admin_user, except: :index

  def index
    @server_racks = @datacenter.server_racks.all

    respond_to do |format|
      format.html
      format.json { render json: @server_racks }
    end
  end

  #def show
  #  @server_rack = ServerRack.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @server_rack }
  #  end
  #end

  def new
    @server_rack = @datacenter.server_racks.build

    respond_to do |format|
      format.html
      format.json { render json: @server_rack }
    end
  end

  def edit
    @server_rack = @datacenter.server_racks.find(params[:id])
  end

  def create
    @server_rack = @datacenter.server_racks.new(params[:server_rack])

    respond_to do |format|
      if @server_rack.save
        format.html { redirect_to datacenter_server_racks_path(@datacenter), notice: 'Server rack was successfully created.' }
        format.json { render json: @server_rack, status: :created, location: @server_rack }
      else
        format.html { render action: "new" }
        format.json { render json: @server_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @server_rack = @datacenter.server_racks.find(params[:id])

    respond_to do |format|
      if @server_rack.update_attributes(params[:server_rack])
        format.html { redirect_to datacenter_server_racks_path(@datacenter), notice: 'Server rack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @server_rack = ServerRack.find(params[:id])
    @server_rack.destroy

    respond_to do |format|
      format.html { redirect_to datacenter_server_racks_path(@datacenter), notice: 'Server rack was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
  def init_datacenter
    @datacenter = Datacenter.find(params[:datacenter_id])
  end
end
