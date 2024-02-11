require 'rails_helper'

RSpec.describe CompanyProject, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
  end
end