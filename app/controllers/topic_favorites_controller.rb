class TopicFavoritesController < ApplicationController
  def index
    if user_signed_in?
    @topic_favorite_topics = current_user.topic_favorite_topics
    elsif company_signed_in?
    @topic_favorite_topics = current_company.topic_favorite_topics
    end 
  end

  def create
    if user_signed_in?
      topic_favorite = TopicFavorite.new
      topic_favorite.topic_id = params[:topic_id]
      topic_favorite.user_id = current_user.id
    elsif company_signed_in?
      topic_favorite = TopicFavorite.new
      topic_favorite.topic_id = params[:topic_id]
      topic_favorite.company_id = current_company.id
    end
    if topic_favorite.save
      redirect_to topics_path, notice: 'いいねしました'
    else
      redirect_to topics_path, alert: 'いいねできませんでした'
    end
  end

  def destroy
    if user_signed_in?
    topic_favorite = TopicFavorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    topic_favorite.destroy
    redirect_to topics_path, alert: '削除しました'
    elsif company_signed_in?
      topic_favorite = TopicFavorite.find_by(company_id: current_company.id, topic_id: params[:topic_id])
      topic_favorite.destroy
      redirect_to topics_path, alert: '削除しました'
    end
  end
end
