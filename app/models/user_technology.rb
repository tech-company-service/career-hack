class UserTechnology < ApplicationRecord
  #
  # Associations
  #
  belongs_to :user
  belongs_to :technology

  enum proficiency_level: { no_experience: 0, beginner: 1, basic: 2, intermediate: 3, advanced: 4, expert: 5 }
end
