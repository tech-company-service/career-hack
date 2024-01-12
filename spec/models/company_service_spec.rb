require 'rails_helper'

RSpec.describe CompanyService, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
  end
end
