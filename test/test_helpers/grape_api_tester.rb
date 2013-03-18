require Rails.root.join("lib/extensions/hashie_ext")

class MiniTest::Unit::TestCase
  # Asserts the ids of objects are the same
  # assert_same_ids @users, @drivers
  def assert_same_ids(expected, actual)
    assert_same_elements expected.map(&:id), actual.map(&:id)
  end

  # Asserts json error response is as expected
  # assert_json_error /not found/, 401
  def assert_json_error(pattern, status=400)
    assert_equal status, response.status
    assert_match pattern, JSON.parse(response.body)['error']
  end
end

class GrapeEndpointTest < ActionDispatch::IntegrationTest
  def self.test_class
    test_caller = caller.find { |c| c =~ /<class:/ && c !~ /GrapeEndpointTest/  }
    const_get(test_caller[/\<class:(.*?)\>/, 1])
  end

  # Records the endpoint being tested
  def self.endpoint(name=nil)
    name ? @_endpoint = name : @_endpoint
  end

  # Records the version
  def self.version(version=nil)
    version ? @_version = version : (@_version || "v1")
  end

  def self.base_url
    "/api/v1/#{self.test_class.endpoint}"
  end

  # api_get :index, :user => @user
  [:get, :post, :put, :delete].each do |m|
    # Send post response and store json response
    define_method "api_#{m}" do |url, params={}, headers={}, *args|
      user = params.delete(:user) || create(:user)
      headers ||= { }
      headers['HTTP_AUTHORIZATION'] = basic_auth_header
      headers['HTTP_X_USER_AUTH'] = user.id unless params[:auth] == false
      method(m).call("#{self.class.base_url}/#{url}", params, headers, *args)
      # Set json body
      @json_body = begin
        Hashie::Mash.construct(JSON.parse(response.body))
      rescue Exception => e
        nil
      end
      # Print out 500 exceptions
      if json_status == 500
        puts response.body
      end
    end
  end

  # Returns json_response hash
  def json_body
    @json_body
  end

  # Returns json_status code
  def json_status
    response.status
  end


  # Basic Auth digest
  def basic_auth_header
    ActionController::HttpAuthentication::Basic.encode_credentials(API_USERNAME, API_PASSWORD)
  end

end