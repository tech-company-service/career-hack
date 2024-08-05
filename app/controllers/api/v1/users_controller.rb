class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_by(uid: params[:uid])

    if user
      render json: user, include: %w[industries company_selection_preferences technologies]
    else
      render json: { error: 'ユーザーが見つかりませんでした' }, status: :not_found
    end
  end

  def create
    user = User.find_by(uid: params[:uid])
    if user
      head :ok
    else
      User.create!(provider: params[:provider], uid: params[:uid], name: params[:name], email: params[:email])
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def update
    user = User.find_by(uid: params[:uid])
    if user
      user.update!(user_params)
      head :ok
    else
      render json: { error: '更新できませんでした' }, status: :not_found
    end
  rescue StandardError => e
    render json: { errors: { displayed_message: '更新できませんでした', error_message: e.message } }, status: :internal_server_error
  end

  private

  def user_params
    params.permit(
      :name, :email, :nick_name, :graduate_year, :target_position, :introduction,
      :x_url, :qiita_url, :zenn_url, :github_url, :wantedly_url, :other_url,
      :research_content, :career_vision
    )
  end
end
