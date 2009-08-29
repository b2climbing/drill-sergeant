namespace :db do
  desc "Populate the database with some test data"
  task :test_data => :environment do
    Exercise.destroy_all
    Sequence.destroy_all
    SequenceExercise.destroy_all
    e1 = Exercise.create(:name => 'Sit-up')
    e2 = Exercise.create(:name => 'Push-up')
    e3 = Exercise.create(:name => 'Squat')
    s = Sequence.create(:name => 'Hardcore')
    SequenceExercise.create!(:sequence => s, :exercise => e1)
    SequenceExercise.create(:sequence => s, :exercise => e2)
    SequenceExercise.create(:sequence => s, :exercise => e3)
  end
end