namespace :task do
  desc '初期データ一括投入'
  task insert_all: :environment do
    Rake::Task['task:insert_companies'].invoke
    Rake::Task['task:insert_benefits'].invoke
    Rake::Task['task:insert_articles'].invoke
    Rake::Task['task:insert_company_abouts'].invoke
    Rake::Task['task:insert_company_projects'].invoke
    Rake::Task['task:insert_job_offers'].invoke
    Rake::Task['task:insert_services'].invoke
    Rake::Task['task:insert_technologies'].invoke
  end
end
