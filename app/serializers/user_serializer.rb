class UserSerializer < ActiveModel::Serializer
  attributes :uid, :name, :email, :nick_name, :graduate_year, :target_position, :introduction, :x_url, :qiita_url, :zenn_url, :github_url, :wantedly_url, :other_url,
             :research_content, :career_vision

  has_many :industries, serializer: IndustrySerializer
  has_many :company_selection_preferences, serializer: CompanySelectionPreferenceSerializer
  has_many :technologies, serializer: TechnologySerializer
end
