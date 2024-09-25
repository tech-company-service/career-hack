require 'rails_helper'

RSpec.describe UserCompanySelectionPreference, type: :model do
  describe 'Associations' do
    it { should belong_to(:company_selection_preference) }
    it { should belong_to(:user) }
  end
end
