class JobOfferSerializer < ActiveModel::Serializer
  attributes :id,  :occupation_type

  # def occupation_type
  #   # 後でI18n対応
  # end
end
