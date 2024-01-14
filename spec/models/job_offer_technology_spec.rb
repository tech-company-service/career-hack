require 'rails_helper'

RSpec.describe JobOfferTechnology, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:technology_id) }
    it { should validate_presence_of(:job_offer_id) }
  end

  describe "Associations" do
    it { should belong_to(:job_offer) }
    it { should belong_to(:technology) }
  end
end
