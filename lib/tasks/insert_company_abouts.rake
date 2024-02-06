require 'csv'

namespace :task do
  desc '「企業について」を一括投入する'
  task insert_company_abouts: :environment do
    logger = Logger.new('log/insert_company_abouts.log')
    company = Company.first

    CSV.foreach('lib/tasks/company_abouts.csv', headers: true) do |row|
      about = CompanyAbout.new(
        company_id: company.id,
        title: row[0],
        content: row[1]
      )
      about.save!
    end
  rescue StandardError => e
    logger.error("「」の一括投入に失敗しました\n#{e}")
  end
end