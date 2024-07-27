require 'rails_helper'

RSpec.describe UserDesiredIndustry, type: :model do
  describe 'Associations' do
    it { should belong_to(:industry) }
    it { should belong_to(:user) }
  end
end
