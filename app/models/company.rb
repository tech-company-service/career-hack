class Company < ApplicationRecord
  include Hashid::Rails

  #
  # callbacks
  #
  after_create :set_hash_id

  # Associations
  has_many :company_services
  has_many :company_articles
  has_many :articles, through: :company_articles
  has_many :job_offers, dependent: :destroy
  has_many :interns, dependent: :destroy
  has_many :company_benefits, dependent: :destroy
  has_many :company_abouts, dependent: :destroy
  has_many :company_projects, dependent: :destroy

  #
  # validations
  #
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :hash_id, presence: true, uniqueness: { case_sensitive: true }, length: { is: HASH_ID_LENGTH }, on: :update
  validates :average_salary, numericality: { greater_than_or_equal_to: 0 }
  validates :initial_salary, numericality: { greater_than_or_equal_to: 0 }
  validates :average_age, numericality: { greater_than_or_equal_to: 0 }
  validates :employees, numericality: { greater_than_or_equal_to: 0 }
  
  private

  def set_hash_id
    self.hash_id = hashid
    save
  end
end
