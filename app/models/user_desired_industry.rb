class UserDesiredIndustry < ApplicationRecord
  #
  # Associations
  #
  belongs_to :industry
  belongs_to :user
end
