class TopicFavoritesController < ApplicationController
  def index
    @topic_favorite_topics = current_user.topic_favorite_topics
  end

  def create
    topic_favorite = TopicFavorite.new
    topic_favorite.user_id = current_user.id
    topic_favorite.topic_id = params[:topic_id]
    if topic_favorite.save
      redirect_to topics_path, notice: 'いいねしました'
    else
      redirect_to topics_path, alert: 'いいねできませんでした'
    end
  end

  def destroy
    topic_favorite = TopicFavorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    topic_favorite.destroy
    redirect_to topics_path, alert: '削除しました'
  end
end
