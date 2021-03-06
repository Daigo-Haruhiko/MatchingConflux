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
    @profiles = Profile.all.includes(:profile_favorite_companies, :profile_favorite_users)
  end

  def edit
    @profile = find_profile_by_id
  end

  def update
    @profile = find_profile_by_id
    @profile.update(profile_params)
    redirect_to profiles_path, notice: '更新しました'
  end

  def destroy
    @profile = find_profile_by_id
    if @profile.company_id == current_company.id
    @profile.destroy
  end
    redirect_to profiles_path, alert: '削除しました'
  end

  private
  def profile_params
    params.require(:profile).permit(:salary, :phone, :image, :description, :address)
  end

  def find_profile_by_id
    Profile.find(params[:id])
  end

end
