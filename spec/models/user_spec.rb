require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:user_technologies).dependent(:destroy) }
  end

  describe 'Enums' do
    it {
      should define_enum_for(:target_position).with_values(
        frontend_engineer: 0,
        backend_engineer: 1,
        mobile_app_engineer: 2,
        infra_engineer: 3,
        security_engineer: 4,
        se: 5,
        data_scientist: 6,
        game_engineer: 7,
        game_producer_director: 8,
        ui_ux_designer: 9,
        web_designer: 10,
        product_manager: 11
      )
    }
  end
end
