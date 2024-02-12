require 'rails_helper'

RSpec.describe JobOfferTechnology, type: :model do
  describe "Associations" do
    it { should belong_to(:job_offer) }
    it { should belong_to(:technology) }
  end
end
