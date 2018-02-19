class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    begin current_company.profiles.create!(profile_params)
      redirect_to profiles_path, notice: '投稿しました'
    rescue ActiveRecord::RecordInvalid
      @profile = Profile.new
      flash.now[:alert] = '投稿できませんでした'
      render :new
    end
  end

  def index
    @profiles = Profile.all
  end

  private
  def profile_params
    params.require(:profile).permit(:salary, :phone, :image, :description)
  end

end
