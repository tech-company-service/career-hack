require 'rails_helper'

RSpec.describe CompanyArticle, type: :model do
  describe "Associations" do
    it { should belong_to(:company) }
    it { should belong_to(:article) }
  end
end
