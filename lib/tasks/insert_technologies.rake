require 'csv'

namespace :task do
  desc '技術情報を一括投入する'
  task insert_technologies: :environment do
    logger = Logger.new('log/insert_technologies.log')
    company = Company.first

    CSV.foreach('lib/tasks/technologies.csv', headers: true) do |row|
      service = Technology.new(
        name: row[0],
        category_type: row[1].to_i,
      )
      service.save!
    end
  rescue StandardError => e
    logger.error("技術情報の一括投入に失敗しました\n#{e}")
  end
end
