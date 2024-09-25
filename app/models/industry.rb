class Industry < ApplicationRecord
  #
  # Associations
  #
  has_many :user_desired_industries, dependent: :destroy
  has_many :users, through: :user_desired_industries

  #
  # validations
  #
  validates :name, presence: true
end
