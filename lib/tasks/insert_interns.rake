require 'csv'

namespace :task do
  desc 'インターンを一括投入する'
  task insert_interns: :environment do
    logger = Logger.new('log/insert_intern.log')

    CSV.foreach('lib/tasks/intern.csv', headers: true) do |row|
      company_name = row[0]
      company = Company.find_by(name: company_name) if company_name.present?

      if company.nil?
        logger.error("企業が見つかりません: #{company_name}")
        next
      end

      iontern = Intern.new(
        company_id: company.id,
        title: row[1],
        description: row[2],
        link: row[3],
        entry_deadline_date: row[4],
        started_at: row[5],
        ended_at: row[6],
        site: row[7],
        style_type: row[8].to_i,
        recruitment_type: row[9].to_i,
        reward: row[10],
        capacity: row[11],
        necessary_requirements: row[12],
        welcome_requirements: row[13],
        technologies: row[14]
      )
      iontern.save!
    end
  rescue StandardError => e
    logger.error("インターンの一括投入に失敗しました\n#{e}")
  end
end
