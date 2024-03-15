require 'csv'

namespace :task do
  desc 'サービスを一括投入する'
  task insert_services: :environment do
    logger = Logger.new('log/insert_service.log')

    CSV.foreach('lib/tasks/company_service.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name)
      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end
      service = CompanyService.new(
        company_id: company.id,
        name: row[1],
        description: row[2],
        launched_at: row[3],
        url: row[4]
      )
      service.save!
    end
  rescue StandardError => e
    logger.error("サービスの一括投入に失敗しました\n#{e}")
  end
end
