class VendorController < ApplicationController

  def index
    @vendors = Vendor.all.order(id: :asc)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params_vendor)

    if @vendor.save
        redirect_to vendor_index_path
    else
        render 'new'
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
      if @vendor.update(params_vendor)
        redirect_to vendor_index_path
      else
        render 'edit'
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to vendor_index_path
  end

  private

  def params_vendor
    params.require(:vendor).permit(:name, :mobile)
  end

end
