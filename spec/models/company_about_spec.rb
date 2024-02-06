require 'rails_helper'

RSpec.describe CompanyAbout, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
  end
end
