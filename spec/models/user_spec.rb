require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:user_technologies).dependent(:destroy) }
  end
end
