class InternSerializer < ApplicationSerializer
  attributes :intern_id, :title, :description, :link, :entry_deadline_date, :started_at, :ended_at, :period, :site, :style_type, :recruitment_type

  belongs_to :company, serializer: CompanySerializer

  def recruitment_type
    I18n.t("activerecord.attributes.intern.recruitment_types.#{object.recruitment_type}")
  end

  def style_type
    I18n.t("activerecord.attributes.intern.style_types.#{object.style_type}")
  end

  def intern_id
    object.id
  end
end
