require 'csv'

namespace :task do
  desc '求人情報を一括投入する'
  task insert_job_offers: :environment do
    logger = Logger.new('log/insert_job_offers.log')
    company = Company.first

    CSV.foreach('lib/tasks/insert_job_offers.csv', headers: true) do |row|
      jo = JobOffer.new(
        company_id: company.id,
        name: row[0],
        description: row[1]
      )
      jo.save!
    end
  rescue StandardError => e
    logger.error("jobofferの投入に失敗しました\n#{e}")
  end
end
