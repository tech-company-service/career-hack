require 'rails_helper'

RSpec.describe UserTechnology, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:technology) }
  end
end
