require 'rails_helper'

RSpec.describe Technology, type: :model do
  describe 'validations' do
    subject { build(:technology) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { should have_many(:technology_technology_categories) }
    it { should have_many(:technology_categories).through(:technology_technology_categories) }
  end
end
