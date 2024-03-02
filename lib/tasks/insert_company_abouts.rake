require 'csv'

namespace :task do
  desc '「企業について」を一括投入する'
  task insert_company_abouts: :environment do
    logger = Logger.new('log/insert_company_abouts.log')
    
    CSV.foreach('lib/tasks/company_abouts.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name)
      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end
      about = CompanyAbout.new(
        company_id: company.id,
        title: row[1],
        content: row[2]
      )
      about.save!
    end
  rescue StandardError => e
    logger.error("「企業について」の一括投入に失敗しました\n#{e}")
  end
end
