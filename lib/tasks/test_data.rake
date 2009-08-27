namespace :db do
  desc "Populate the database with some test data"
  task :test_data => :environment do
    Exercise.create(:name => 'Sit-up')
  end
end