class RackUnitsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  # GET /rack_units
  # GET /rack_units.json
  def index
    @rack_units = RackUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rack_units }
    end
  end

  # GET /rack_units/1
  # GET /rack_units/1.json
  def show
    @rack_unit = RackUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rack_unit }
    end
  end

  # GET /rack_units/new
  # GET /rack_units/new.json
  def new
    @rack_unit = RackUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rack_unit }
    end
  end

  # GET /rack_units/1/edit
  def edit
    @rack_unit = RackUnit.find(params[:id])
  end

  # POST /rack_units
  # POST /rack_units.json
  def create
    @rack_unit = RackUnit.new(params[:rack_unit])

    respond_to do |format|
      if @rack_unit.save
        format.html { redirect_to @rack_unit, notice: 'Rack unit was successfully created.' }
        format.json { render json: @rack_unit, status: :created, location: @rack_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @rack_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rack_units/1
  # PUT /rack_units/1.json
  def update
    @rack_unit = RackUnit.find(params[:id])

    respond_to do |format|
      if @rack_unit.update_attributes(params[:rack_unit])
        format.html { redirect_to @rack_unit, notice: 'Rack unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rack_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rack_units/1
  # DELETE /rack_units/1.json
  def destroy
    @rack_unit = RackUnit.find(params[:id])
    @rack_unit.destroy

    respond_to do |format|
      format.html { redirect_to rack_units_url }
      format.json { head :no_content }
    end
  end
end
