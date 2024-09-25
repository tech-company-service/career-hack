require 'csv'

namespace :task do
  desc 'Industryを一括投入する'
  task insert_industries: :environment do
    logger = Logger.new('log/insert_industries.log')

    begin
      CSV.foreach('lib/tasks/industries.csv', headers: true) do |row|
        industry = Industry.new(name: row[0])
        if industry.save
          logger.info("Industry #{industry.name} が正常に作成されました")
        else
          logger.error("Industry #{industry.name} の作成に失敗しました: #{industry.errors.full_messages.join(', ')}")
        end
      end
    rescue StandardError => e
      logger.error("Industryの一括投入に失敗しました\n#{e}")
    end
  end
end
