class InternSerializer < ApplicationSerializer
  attributes :intern_id, :title, :description, :link, :entry_deadline_date, :started_at, :ended_at, :period, :site, :style_type, :recruitment_type

  belongs_to :company, serializer: CompanySerializer

  def style_type
    # 国際化対応
  end

  def recruitment_type
    # 国際化対応
  end

  def intern_id
    object.id
  end
end
