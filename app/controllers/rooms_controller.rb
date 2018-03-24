class RoomsController < ApplicationController
  def create
    # binding.pry
    if user_signed_in?
      @room = Room.find_or_create_by(user_id: params[:user_id], company_id: params[:company_id])
      redirect_to room_path(@room)
    elsif company_signed_in?
      @room = Room.find_or_create_by(user_id: params[:user_id], company_id: params[:company_id])
      redirect_to room_path(@room)
    end
  end

  def show
    if user_signed_in?
      @room = Room.find(params[:id])
      @user = User.find(current_user.id)
      @messages = @room.messages
    elsif company_signed_in?
      @room = Room.find(params[:id])
      @company = Company.find(current_company.id)
      @messages = @room.messages
    end 
  end
end
