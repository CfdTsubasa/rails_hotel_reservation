class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド

  def index
    @rooms = Room.paginate(page: params[:page], per_page: 12)
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    @reservation = Reservation.new
  end

  def edit; end

  def create
    @room = Room.new(room_params)
    @room.image.attach(params[:room][:image])
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path
    else
      flash.now[:danger] = '登録に失敗しました。'
      render 'rooms/new'
    end
  end

  def search
    @rooms = Room.search(params[:search_area], params[:search_keyword]).order(id: 'DESC')
    @count = @rooms.count
    @room = Room.new
  end

  def update; end

  def destroy; end

  private

  def room_params
    params.require(:room).permit(:name, :content, :address, :price, :image) # roomモデルのカラムのみを許可
  end
end
