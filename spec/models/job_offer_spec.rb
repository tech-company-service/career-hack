require 'rails_helper'

RSpec.describe JobOffer, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
    it { should have_many(:job_offer_technologies) }
    it { should have_many(:technologies).through(:job_offer_technologies) }
  end
end
