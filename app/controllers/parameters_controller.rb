class ParametersController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  def index
    @parameters = Parameter.all

    respond_to do |format|
      format.html
      format.json { render json: @parameters }
    end
  end

  def show
    @parameter = Parameter.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @parameter }
    end
  end

  def new
    @parameter = Parameter.new

    respond_to do |format|
      format.html
      format.json { render json: @parameter }
    end
  end

  def edit
    @parameter = Parameter.find(params[:id])
  end

  def create
    @parameter = Parameter.new(params[:parameter])

    respond_to do |format|
      if @parameter.save
        format.html { redirect_to @parameter, notice: 'Parameter was successfully created.' }
        format.json { render json: @parameter, status: :created, location: @parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @parameter = Parameter.find(params[:id])

    respond_to do |format|
      if @parameter.update_attributes(params[:parameter])
        format.html { redirect_to @parameter, notice: 'Parameter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @parameter = Parameter.find(params[:id])
    @parameter.destroy

    respond_to do |format|
      format.html { redirect_to parameters_url }
      format.json { head :no_content }
    end
  end
end
