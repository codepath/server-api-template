module UploadHelpers
  def uploaded_file(path, type)
    Rack::Test::UploadedFile.new(path, type)
  end
end