require 'csv'

namespace :task do
  desc '初任給詳細データを追加する'
  task update_company: :environment do
    logger = Logger.new('log/update_company_with_detailed_initial_salary.log')
    company = Company.first

    CSV.foreach('lib/tasks/update_company_with_detailed_initial_salary.csv', headers: true) do |row|
      company.update!(detailed_initial_salary: row[1])
    end
  rescue StandardError => e
    logger.error("初任給詳細のupdateに失敗しました\n#{e}")
  end
end