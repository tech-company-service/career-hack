require 'rails_helper'

RSpec.describe Industry, type: :model do
  describe 'Associations' do
    it { should have_many(:user_desired_industries).dependent(:destroy) }
    it { should have_many(:users).through(:user_desired_industries) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
