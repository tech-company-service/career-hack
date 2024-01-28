require 'rails_helper'

RSpec.describe Technology, type: :model do
  describe 'validations' do
    subject { build(:technology) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { should have_many(:job_offer_technologies) }
    it { should have_many(:job_offers).through(:job_offer_technologies) }
  end
end
