require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:published_at) }
  end

  describe "Associations" do
    it { should have_many(:company_articles) }
    it { should have_many(:companies).through(:company_articles) }
  end
end
