require 'csv'

namespace :task do
  desc 'CompanySelectionPreferenceを一括投入する'
  task insert_company_selection_preferences: :environment do
    logger = Logger.new('log/insert_company_selection_preferences.log')

    begin
      CSV.foreach('lib/tasks/company_selection_preferences.csv', headers: true) do |row|
        preference = CompanySelectionPreference.new(name: row[0])
        if preference.save
          logger.info("CompanySelectionPreference #{preference.name} が正常に作成されました")
        else
          logger.error("CompanySelectionPreference #{preference.name} の作成に失敗しました: #{preference.errors.full_messages.join(', ')}")
        end
      end
    rescue StandardError => e
      logger.error("CompanySelectionPreferenceの一括投入に失敗しました\n#{e}")
    end
  end
end
