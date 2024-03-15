require 'csv'

namespace :task do
  desc '企業の事業内容を一括投入する'
  task insert_company_projects: :environment do
    logger = Logger.new('log/company_projects.log')
    company = Company.first

    CSV.foreach('lib/tasks/company_projects.csv', headers: true) do |row|
      project = CompanyProject.new(
        company_id: company.id,
        name: row[0]
      )
      project.save!
    end
  rescue StandardError => e
    logger.error("企業の事業内容の一括投入に失敗しました\n#{e}")
  end
end
