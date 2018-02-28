class TopicCommentsController < ApplicationController
  def new
    @topic_comment = TopicComment.new
    @topic_comment.topic_id = params[:topic_id]
  end

  def create
    if user_signed_in?
    begin current_user.topic_comments.create!(comment_params)
     redirect_to topics_path, notice: 'コメントしました'
   rescue ActiveRecord::RecordInvalid
     @topic_comment = TopicComment.new
     flash.now[:alert] = 'コメントできませんでした'
     render :new
    end
  elsif company_signed_in?
    begin current_company.topic_comments.create!(comment_params)
     redirect_to topics_path, notice: 'コメントしました'
   rescue ActiveRecord::RecordInvalid
     @topic_comment = TopicComment.new
     flash.now[:alert] = 'コメントできませんでした'
     render :new
    end
  end
 end

 def destroy
   if user_signed_in?
   topic_comment = TopicComment.find_by(user_id: current_user.id, topic_id: params[:topic_id])
   topic_comment.destroy
   redirect_to topics_path, alert: '削除しました'
 elsif company_signed_in?
   topic_comment = TopicComment.find_by(company_id: current_company.id, topic_id: params[:topic_id])
   topic_comment.destroy
   redirect_to topics_path, alert: '削除しました'
 end
 end

  private
  def comment_params
    params.require(:topic_comment).permit(:user_id, :topic_id, :comment, :company_id)
  end
end
