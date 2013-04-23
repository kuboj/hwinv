class PositionsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  def index
    @positions = Position.all

    respond_to do |format|
      format.html
      format.json { render json: @positions }
    end
  end

  def show
    @position = Position.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @position }
    end
  end

  def new
    @position = Position.new

    respond_to do |format|
      format.html
      format.json { render json: @position }
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :no_content }
    end
  end
end
