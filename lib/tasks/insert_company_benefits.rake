require 'csv'

namespace :task do
  desc '福利厚生を一括投入する'
  task insert_benefits: :environment do
    logger = Logger.new('log/insert_benefits.log')
    company = Company.first

    CSV.foreach('lib/tasks/company_benefits.csv', headers: true) do |row|
      benefit = CompanyBenefit.new(
        company_id: company.id,
        title: row[0],
        content: row[1]
      )
      benefit.save!
    end
  rescue StandardError => e
    logger.error("福利厚生の一括投入に失敗しました\n#{e}")
  end
end
