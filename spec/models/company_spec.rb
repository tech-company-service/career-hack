require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    subject { build(:company) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_numericality_of(:average_salary).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:initial_salary).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:average_age).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:employees).is_greater_than(0) }
  end

  describe "Associations" do
    it { should have_many(:company_technology_technology_categories) }
    it { should have_many(:technology_technology_categories).through(:company_technology_technology_categories) }
    it { should have_many(:company_services) }
    it { should have_many(:company_articles) }
    it { should have_many(:articles).through(:company_articles) }
  end
end
