class CompanyArticle < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company
  belongs_to :article
end
