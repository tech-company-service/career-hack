require 'rails_helper'

RSpec.describe CompanyArticle, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
  end
end
