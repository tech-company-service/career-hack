require 'rails_helper'

RSpec.describe Intern, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:style_type) }
    it { is_expected.to validate_presence_of(:recruitment_type) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
  end
end
