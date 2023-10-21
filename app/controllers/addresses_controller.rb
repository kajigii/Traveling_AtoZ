class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def address_params
    params.require(:address).permit(:departure, :destination_1, :destination_2).merge(user_id: current_user.id)
  end
end
