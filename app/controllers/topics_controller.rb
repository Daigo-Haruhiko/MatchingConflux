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
    @topics = Topic.all
  end

  private
  def topic_params
    params.require(:topic).permit(:salary, :phone, :image, :description)
  end

end
