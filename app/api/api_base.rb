# BaseClass makes working with grape easier
class ApiBase < Grape::API
  # Loads a grape api routes file
  # load_routes :users, :posts
  # Make sure to name routes users.rb => UsersApi
  def self.load_routes(*names)
    names.each do |name|
      mount Endpoints.const_get(:"#{name.to_s.camelize}")
    end
  end
end