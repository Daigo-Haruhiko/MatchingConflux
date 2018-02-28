class ProfileCommentsController < ApplicationController
  def new
    @profile_comment = ProfileComment.new
    @profile_comment.profile_id = params[:profile_id]
  end

  def create
    if company_signed_in?
    begin current_company.profile_comments.create!(comment_params)
      redirect_to profiles_path, notice: 'コメントしました'
    rescue
      flash.now[:alert] = 'コメントできませんでした'
      render :new
    end
  elsif user_signed_in?
    begin current_user.profile_comments.create!(comment_params)
      redirect_to profiles_path, notice: 'コメントしました'
    rescue
      flash.now[:alert] = 'コメントできませんでした'
      render :new
    end
  end
  end

  def destroy
    if company_signed_in?
    profile_comment = ProfileComment.find_by(company_id: current_company.id, profile_id: params[:profile_id])
    profile_comment.destroy
    redirect_to profiles_path, alert: '削除しました'
  elsif user_signed_in?
    profile_comment = ProfileComment.find_by(user_id: current_user.id, profile_id: params[:profile_id])
    profile_comment.destroy
    redirect_to profiles_path, alert: '削除しました'
  end
end

  private
  def comment_params
    params.require(:profile_comment).permit(:company_id, :profile_id, :comment, :user_id)
  end

end
