require 'test_helper'

class SessionsEndpointTest < GrapeEndpointTest
  endpoint :sessions

  before do
    @user = create(:user)
  end

  describe "authenticate" do
    it "returns 201 for successful authentication" do
      api_post :authenticate, :email => @user.email, :password => "secret"
      assert_equal 201, json_status
      assert_equal @user.id, json_body.user.id
    end

    it "returns 404 for invalid email" do
      api_post :authenticate, :email => "fake@fake.com", :password => "secret"
      assert_json_error(/user not/, 404)
    end

    it "returns 401 for invalid pass" do
      api_post :authenticate, :email => @user.email, :password => "fake"
      assert_json_error(/invalid password/, 401)
    end

    it "returns 400 for no email" do
      api_post :authenticate, :password => "fake"
      assert_json_error(/missing parameter: email/, 400)
    end
  end # authenticate
end # SessionsEndpoint