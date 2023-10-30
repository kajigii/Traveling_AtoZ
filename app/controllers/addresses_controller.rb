class AddressesController < ApplicationController
  def index
    # @departure = Departure.find(1)
    # @first_destination = FirstDestination.find(1)
    # @second_destination = SecondDestination.find(1)
  end

  def new
    @departure = Departure.new
    @first_destination = FirstDestination.new
    @second_destination = SecondDestination.new
  end

  def create_and_calculate
    @departure = Departure.new(departure_params)
    @first_destination = FirstDestination.new(first_destination_params)
    @second_destination = SecondDestination.new(second_destination_params)
    if @departure.save && @first_destination.save && @second_destination.save
      # 出発地、目的地1、目的地2のアドレスをデータベースから読み込み
      @departure = Departure.find_by(address: departure_params[:address])
      @first_destination = FirstDestination.find_by(address: first_destination_params[:address])
      @second_destination = SecondDestination.find_by(address: second_destination_params[:address])
      # Geocoderを使用して緯度経度情報を取得
      departure_coordinates = [@departure.latitude, @departure.longitude]
      destination1_coordinates = [@first_destination.latitude, @first_destination.longitude]
      destination2_coordinates = [@second_destination.latitude, @second_destination.longitude]
      
      # 最短距離の計算（Haversine formulaを使用）
      distance_to_destination1 = Geocoder::Calculations.distance_between(departure_coordinates, destination1_coordinates)
      distance_to_destination2 = Geocoder::Calculations.distance_between(departure_coordinates, destination2_coordinates)

      puts "distance_to_destination1: #{distance_to_destination1}"
      puts "distance_to_destination2: #{distance_to_destination2}"

      
      # 最短距離の計算
      if distance_to_destination1 < distance_to_destination2
        @shortest_destination = @first_destination.address
        @long_destination = @second_destination.address
      else
        @shortest_destination = @second_destination.address
        @long_destination = @first_destination.address
      end
      redirect_to show_path(@departure)
    else
      render :new, status: :unprocessable_entity
    end

    def show
      @shortest_destination = @shortest_destination
      @long_destination = @long_destination
    end 
  end

  private

  def departure_params
    params.require(:departure).permit(:address).merge(user_id: current_user.id)
  end

  def first_destination_params
    params.require(:first_destination).permit(:address).merge(user_id: current_user.id)
  end

  def second_destination_params
    params.require(:second_destination).permit(:address).merge(user_id: current_user.id)
  end
end
