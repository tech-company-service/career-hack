require 'rails_helper'

RSpec.describe TechnologyCategory, type: :model do
  describe 'validations' do
    subject { build(:technology_category) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { should have_many(:technology_technology_categories) }
    it { should have_many(:technologies).through(:technology_technology_categories) }
  end
end
