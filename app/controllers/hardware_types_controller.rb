class HardwareTypesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, except: :index

  def new
    @hardware_type = HardwareType.new
  end

  def create
    @hardware_type = HardwareType.new(params[:hardware_type])
    if @hardware_type.save
      flash[:success] = 'Hardware type successfully created'
      redirect_to hardware_types_path
    else
      render 'new'
    end
  end

  def edit
    @hardware_type = HardwareType.find(params[:id])
  end

  def index
    @hardware_types = HardwareType.paginate(page: params[:page])
  end

  def update
    @hardware_type = HardwareType.find(params[:id])
    if @hardware_type.update_attributes(params[:hardware_type])
      flash[:success] = 'Hardware type updated'
      redirect_to hardware_types_path
    else
      render 'edit'
    end
  end

  def destroy
    HardwareType.find(params[:id]).destroy
    flash[:success] = 'Hardware type destroyed.'
    redirect_to hardware_types_path
  end
end
