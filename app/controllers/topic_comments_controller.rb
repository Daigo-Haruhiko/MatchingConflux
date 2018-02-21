class TopicCommentsController < ApplicationController
  def new
    @topic_comment = TopicComment.new
    @topic_comment.topic_id = params[:topic_id]
  end

  def create
    begin current_user.topic_comments.create!(comment_params)
     redirect_to topics_path, notice: 'コメントしました'
   rescue ActiveRecord::RecordInvalid
     @topic_comment = TopicComment.new
     flash.now[:alert] = 'コメントできませんでした'
     render :new
   end
 end

 def destroy
   topic_comment = TopicComment.find_by(user_id: current_user.id, topic_id: params[:topic_id])
   topic_comment.destroy
   redirect_to topics_path, alert: '削除しました'
 end

  private
  def comment_params
    params.require(:topic_comment).permit(:user_id, :topic_id, :comment)
  end
end
