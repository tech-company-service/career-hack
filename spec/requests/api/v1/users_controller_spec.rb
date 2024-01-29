require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /api/v1/auth/:provider/callback" do
    let(:provider) { 'example_provider' }
    let(:valid_attributes) do
      { provider:, uid: '123456', name: 'Test User', email: 'test@example.com' }
    end

    subject do
      post "/api/v1/auth/#{provider}/callback", params: valid_attributes
    end

    context "有効なパラメーターの場合" do
      it "新しいユーザーを作成して、ステータスコード :ok を返すこと" do
        expect do
          subject
        end.to change(User, :count).by(1)
        expect(response).to have_http_status(:ok)
      end
    end

    context "ユーザーがすでに存在する場合" do
      before do
        User.create!(valid_attributes)
      end

      it "新しいユーザーを作成せず、ステータスコード :ok を返すこと" do
        expect do
          subject
        end.to change(User, :count).by(0)
        expect(response).to have_http_status(:ok)
      end
    end

    context "エラーが発生した場合" do
      before do
        allow(User).to receive(:find_or_create_by!).and_raise(StandardError, '何らかのエラー')
      end

      it "ステータスコード :internal_server_error を返し、エラーメッセージを含むこと" do
        subject
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end
end
