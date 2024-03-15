require 'rails_helper'

RSpec.describe CompanyBenefit, type: :model do
  describe "Associations" do
    it { should belong_to(:company) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
