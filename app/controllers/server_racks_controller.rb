class ServerRacksController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  # GET /server_racks
  # GET /server_racks.json
  def index
    @server_racks = ServerRack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @server_racks }
    end
  end

  # GET /server_racks/1
  # GET /server_racks/1.json
  def show
    @server_rack = ServerRack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server_rack }
    end
  end

  # GET /server_racks/new
  # GET /server_racks/new.json
  def new
    @server_rack = ServerRack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server_rack }
    end
  end

  # GET /server_racks/1/edit
  def edit
    @server_rack = ServerRack.find(params[:id])
  end

  # POST /server_racks
  # POST /server_racks.json
  def create
    @server_rack = ServerRack.new(params[:server_rack])

    respond_to do |format|
      if @server_rack.save
        format.html { redirect_to @server_rack, notice: 'Server rack was successfully created.' }
        format.json { render json: @server_rack, status: :created, location: @server_rack }
      else
        format.html { render action: "new" }
        format.json { render json: @server_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /server_racks/1
  # PUT /server_racks/1.json
  def update
    @server_rack = ServerRack.find(params[:id])

    respond_to do |format|
      if @server_rack.update_attributes(params[:server_rack])
        format.html { redirect_to @server_rack, notice: 'Server rack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server_racks/1
  # DELETE /server_racks/1.json
  def destroy
    @server_rack = ServerRack.find(params[:id])
    @server_rack.destroy

    respond_to do |format|
      format.html { redirect_to server_racks_url }
      format.json { head :no_content }
    end
  end
end
