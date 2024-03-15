require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    subject { build(:company) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_numericality_of(:average_salary).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:initial_salary).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:average_age).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:employees).is_greater_than_or_equal_to(0) }
  end

  describe "Associations" do
    it { should have_many(:job_offers) }
    it { should have_many(:company_services) }
    it { should have_many(:company_articles).dependent(:destroy) }
    it { should have_many(:interns).dependent(:destroy) }
    it { should have_many(:company_benefits).dependent(:destroy) }
    it { should have_many(:company_abouts).dependent(:destroy) }
    it { should have_many(:company_projects).dependent(:destroy) }
  end
end
