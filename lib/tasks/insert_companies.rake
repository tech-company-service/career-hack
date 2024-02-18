require 'csv'

namespace :task do
  desc '企業を一括投入する'
  task insert_companies: :environment do
    logger = Logger.new('log/insert_companies.log')
    CSV.foreach('lib/tasks/insert_companies.csv', headers: true) do |row|
      company = Company.new(
        name: row[0],
        description: row[1],
        address: row[2],
        average_salary: row[3].to_i,
        initial_salary: row[4].to_i,
        detailed_initial_salary: row[5].to_i,
        average_age: row[6].to_i,
        employees: row[6].to_i,
        recruit_url: row[7]
      )
      company.save!
    end
  rescue StandardError => e
    logger.error("企業の一括投入に失敗失敗しました\n#{e}")
  end
end
