# Add Grape API Tests
namespace :test do
  desc "Test api endpoints"
  Rake::TestTask.new(:api) do |t|
    t.libs << "test"
    t.pattern = 'test/api/**/*_test.rb'
    t.verbose = true
  end

end

api_task = Rake::Task["test:api"]
test_task = Rake::Task[:test]
test_task.enhance { api_task.invoke }