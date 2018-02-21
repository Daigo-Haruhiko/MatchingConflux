class ProfileFavoritesController < ApplicationController
  def index
    @profile_favorite_profiles = current_company.profile_favorite_profiles
  end

  def create
    profile_favorite = ProfileFavorite.new
    profile_favorite.company_id = current_company.id
    profile_favorite.profile_id = params[:profile_id]
    if profile_favorite.save
      redirect_to profiles_path, notice: 'いいねしました'
    else
      redirect_to profiles_path, alert: 'いいねできませんでした'
    end
  end

  def destroy
    profile_favorite = ProfileFavorite.find_by(company_id: current_company.id, profile_id: params[:profile_id])
    profile_favorite.destroy
    redirect_to profiles_path, alert: '削除しました'
  end
end
