class RackUnitsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  def index
    @rack_units = RackUnit.all

    respond_to do |format|
      format.html
      format.json { render json: @rack_units }
    end
  end

  def show
    @rack_unit = RackUnit.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @rack_unit }
    end
  end

  def new
    @rack_unit = RackUnit.new

    respond_to do |format|
      format.html
      format.json { render json: @rack_unit }
    end
  end

  def edit
    @rack_unit = RackUnit.find(params[:id])
  end

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

  def destroy
    @rack_unit = RackUnit.find(params[:id])
    @rack_unit.destroy

    respond_to do |format|
      format.html { redirect_to rack_units_url }
      format.json { head :no_content }
    end
  end
end
