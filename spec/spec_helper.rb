require 'activerecord'
require 'rspec'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

Rspec.configure do |config|
  config.after(:each) do
    Emp.all.each { |emps| emps.destroy }
  end
end
