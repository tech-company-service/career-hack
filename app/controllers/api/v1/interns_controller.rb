class Api::V1::InternsController < Api::ApplicationController
  def index
    # 現状、redisへのキャッシュはできていない
    res_interns = Rails.cache.fetch("interns", expires_in: 1.day) do
      interns = Intern.all
      ActiveModelSerializers::SerializableResource.new(interns, each_serializer: InternSerializer).to_json
    end
    render json: res_interns
  end
end