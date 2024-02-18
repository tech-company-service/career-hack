require 'csv'

namespace :task do
  desc '企業の事業内容を一括投入する'
  task insert_company_projects: :environment do
    logger = Logger.new('log/company_projects.log')

    CSV.foreach('lib/tasks/company_projects.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name) if company_name.present?

      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end
      project = CompanyProject.new(
        company_id: company.id,
        name: row[1]
      )
      project.save!
    end
  rescue StandardError => e
    logger.error("企業の事業内容の一括投入に失敗しました\n#{e}")
  end
end
