class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by!(provider: params[:provider], uid: params[:uid], name: params[:name], email: params[:email])
    head :ok if user
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
