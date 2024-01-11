require 'rails_helper'

RSpec.describe CompanyTechnologyTechnologyCategory, type: :model do
  describe "Assciations" do
    it { should belong_to(:company) }
    it { should belong_to(:technology_technology_category) }
  end
end
