class ProfileFavoritesController < ApplicationController
  def index
    if company_signed_in?
    @profile_favorite_profiles = current_company.profile_favorite_profiles
  elsif user_signed_in?
    @profile_favorite_profiles = current_user.profile_favorite_profiles
  end
  end

  def create
    if company_signed_in?
    profile_favorite = ProfileFavorite.new
    profile_favorite.company_id = current_company.id
    profile_favorite.profile_id = params[:profile_id]
    elsif user_signed_in?
    profile_favorite = ProfileFavorite.new
    profile_favorite.user_id = current_user.id
    profile_favorite.profile_id = params[:profile_id]
    end
    if profile_favorite.save
      redirect_to profiles_path, notice: 'いいねしました'
    else
      redirect_to profiles_path, alert: 'いいねできませんでした'
    end
  end

  def destroy
    if company_signed_in?
    profile_favorite = ProfileFavorite.find_by(company_id: current_company.id, profile_id: params[:profile_id])
    profile_favorite.destroy
    redirect_to profiles_path, alert: '削除しました'
  elsif user_signed_in?
    profile_favorite = ProfileFavorite.find_by(user_id: current_user.id, profile_id: params[:profile_id])
    profile_favorite.destroy
    redirect_to profiles_path, alert: '削除しました'
  end
end 
end
