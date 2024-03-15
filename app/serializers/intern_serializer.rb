class InternSerializer < ApplicationSerializer
  attributes :intern_id, :title, :description, :link, :entry_deadline_date, :started_at, :ended_at, :site, :style_type, :recruitment_type, :hash_id, :capacity, :reward,
             :technologies, :necessary_requirements, :welcome_requirements

  belongs_to :company, serializer: CompanySerializer

  def recruitment_type
    I18n.t("enums.intern.recruitment_type.#{object.recruitment_type}")
  end

  def style_type
    I18n.t("enums.intern.style_type.#{object.style_type}")
  end

  def intern_id
    object.id
  end
end
