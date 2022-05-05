class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.paginate(page: params[:page], per_page: 5)
  end

  def back
    @reservation = Reservation.new(reservation_params)
    redirect_to room_path(@reservation.room_id)
  end

  def complete
    Reservation.create(reservation_params)
    render('reservations/complete')
  end

  def show
    @reservation = Reservation.find(params[:room_id])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # @room = Room.find(params[:id])
    # フォームから送られてきたデータ(body)をストロングパラメータを経由して@roomに代入
    # @reservation.save

    redirect_to reservation_path(@reservation)
    # redirect_to action: 'confirm'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :persons, :start_date, :end_date, :total_price) # roomモデルのカラムのみを許可
  end
end
