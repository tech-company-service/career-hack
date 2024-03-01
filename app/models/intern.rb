class Intern < ApplicationRecord
  include Hashid::Rails

  #
  # callbacks
  #
  after_create :set_hash_id

  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :title, :link, :description, :style_type, :recruitment_type, presence: true

  enum recruitment_type: { summer_intern: 0, winter_intern: 1, all_season: 2, others: 3 }
  enum style_type: { on_line: 0, off_line: 1, hybrid: 2 }

  private

  def set_hash_id
    self.hash_id = hashid
    save
  end
end
