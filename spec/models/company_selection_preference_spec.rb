require 'rails_helper'

RSpec.describe CompanySelectionPreference, type: :model do
  describe 'Associations' do
    it { should have_many(:user_company_selection_preferences).dependent(:destroy) }
    it { should have_many(:users).through(:user_company_selection_preferences) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
