class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    begin current_user.topics.create!(topic_params)
      redirect_to topics_path, notice: '投稿しました'
    rescue ActiveRecord::RecordInvalid
      @topic = Topic.new
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @topics = Topic.all.includes(:topic_favorite_users)
  end

  def edit
    @topic = find_topic_by_id
  end

  def update
    @topic = find_topic_by_id
    @topic.update(topic_params)
    redirect_to topics_path, notice: '更新しました'
  end

  def destroy
    @topic = find_topic_by_id
    if @topic.user_id == current_user.id
    @topic.destroy
  end
    redirect_to topics_path, alert: '削除しました'
  end

  private
  def topic_params
    params.require(:topic).permit(:salary, :phone, :image, :description, :college, :address)
  end

  def find_topic_by_id
    Topic.find(params[:id])
  end

end
