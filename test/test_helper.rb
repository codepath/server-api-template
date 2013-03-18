ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest-metadata'

# Test helpers
Dir[File.dirname(__FILE__) + "/test_helpers/*"].each do |f|
  require f
end

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
  include UploadHelpers

  before do
    @request.env["warden"] = warden
  end
end

# Extend minitest
class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

class MiniTest::Spec
  before do
    [User].map(&:delete_all)
  end
end