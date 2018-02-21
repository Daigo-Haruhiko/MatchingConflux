class ProfileCommentsController < ApplicationController
  def new
    @profile_comment = ProfileComment.new
    @profile_comment.profile_id = params[:profile_id]
  end

  def create
    if current_company.profile_comments.create(comment_params)
      redirect_to profiles_path, notice: 'コメントしました'
    else
      flash.now[:alert] = 'コメントできませんでした'
      render :new
    end
  end

  def destroy
    profile_comment = ProfileComment.find_by(company_id: current_company.id, profile_id: params[:profile_id])
    profile_comment.destroy
    redirect_to profiles_path, alert: '削除しました'
  end

  private
  def comment_params
    params.require(:profile_comment).permit(:company_id, :profile_id, :comment)
  end

end
