require 'csv'

namespace :task do
  desc '求人情報を一括投入する'
  task insert_job_offers: :environment do
    logger = Logger.new('log/insert_job_offers.log')

    CSV.foreach('lib/tasks/insert_job_offers.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name)
      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end
      jo = JobOffer.new(
        company_id: company.id,
        name: row[1],
        description: row[2]
      )
      jo.save!
    end
  rescue StandardError => e
    logger.error("jobofferの投入に失敗しました\n#{e}")
  end
end
