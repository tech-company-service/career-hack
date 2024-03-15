require 'csv'

namespace :task do
  desc 'サービスを一括投入する'
  task insert_services: :environment do
    logger = Logger.new('log/insert_service.log')
    company = Company.first

    CSV.foreach('lib/tasks/company_service.csv', headers: true) do |row|
      # row[2] = row[2].gsub(/\n/, '') if row[2].include?("\n")

      service = CompanyService.new(
        company_id: company.id,
        name: row[0],
        description: row[1],
        launched_at: '20001231'
      )
      service.save!
    end
  rescue StandardError => e
    logger.error("サービスの一括投入に失敗しました\n#{e}")
  end
end
