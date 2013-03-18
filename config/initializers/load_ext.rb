# Loads all extensions in lib/extensions
Dir[Rails.root.join("lib/extensions/**/*.rb")].each do |file|
  require file
end