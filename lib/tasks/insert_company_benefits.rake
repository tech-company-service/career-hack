require 'csv'

namespace :task do
  desc '福利厚生を一括投入する'
  task insert_benefits: :environment do
    logger = Logger.new('log/insert_benefits.log')

    CSV.foreach('lib/tasks/company_benefits.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name)
      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end
      benefit = CompanyBenefit.new(
        company_id: company.id,
        title: row[1],
        content: row[2]
      )
      benefit.save!
    end
  rescue StandardError => e
    logger.error("福利厚生の一括投入に失敗しました\n#{e}")
  end
end
