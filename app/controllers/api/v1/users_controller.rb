class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by!(provider: params[:provider], uid: params[:uid], name: params[:name], email: params[:email])                      
    if user
      head :ok
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
