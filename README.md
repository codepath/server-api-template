# Server API Template

This is our CodePath template for giving people an easy way to create RESTful JSON APIs
to power their applications.

## Steps

## Design API Endpoints

 - Based on use cases, flesh out API calls needed by mobile client
 - Specify the "type", "url" and "parameters" (i.e "GET /tweets?user_id=5")

### Define Schema

 - Identify resources in your application (i.e user, tweets, favorites)
 - Identify attributes of each resource (i.e a tweet has a body, timestamp)
 - Identify the "associations" for each resource (i.e a tweet has a user_id)

## Create Models

  - Use `rails g model <NAME>` to generate models for each resource
    - `rails g model Tweet`
  - Fill out the "db/migrate/xxxxx" file for each model
  - Fill out associations for each model (i.e `belongs_to :user`)
  - Fill out any validations for each model (i.e `validates :body, :presence => true`)

## Build Grape Resources

  - Add resources into grape files for each endpoint
  - Write the API endpoint implementation

## Libraries

This project is using several libraries and frameworks:

 - Rails 3.2
 - Grape