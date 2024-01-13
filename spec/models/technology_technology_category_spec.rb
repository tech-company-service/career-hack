require 'rails_helper'

RSpec.describe TechnologyTechnologyCategory, type: :model do
  describe "Associations" do
    it { should belong_to(:technology) }
    it { should belong_to(:technology_category) }
  end
end
