class KeysController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  #def index
  #  @keys = Key.all
  #
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @keys }
  #  end
  #end
  #
  #def show
  #  @key = Key.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @key }
  #  end
  #end

  def new
    @key = Key.new

    respond_to do |format|
      format.html
      format.json { render json: @key }
    end
  end

  def edit
    @key = Key.find(params[:id])
  end

  def create
    @key = Key.new(params[:key])

    respond_to do |format|
      if @key.save
        format.html { redirect_to keys_path, notice: 'Key was successfully created.' }
        format.json { render json: @key, status: :created, location: @key }
      else
        format.html { render action: "new" }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @key = Key.find(params[:id])

    respond_to do |format|
      if @key.update_attributes(params[:key])
        format.html { redirect_to keys_path, notice: 'Key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @key = Key.find(params[:id])
    @key.destroy

    respond_to do |format|
      format.html { redirect_to keys_url,notice: 'Key was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
