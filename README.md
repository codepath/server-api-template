# Server API Template

This is our CodePath template for giving people an easy way to create RESTful JSON APIs
to power their applications.

## Libraries

This project is using several libraries and frameworks:

 - Rails 3.2 (web framework)
 - Grape  (API endpoints)
 - Devise (authentication)

## Installation

### Dependencies

Make sure you have Ruby 1.9.3 and Git installed. Type into the terminal:

```
$ ruby -v
```

Verify you see "ruby 1.9.3pXXX" (where the XXX can be any number). If not then download and run [RailsInstaller](http://railsinstaller.org/) in order to get Ruby.

Then type into the terminal:

```
$ git --version
```

If you get an error then download and run [RailsInstaller](http://railsinstaller.org/) in order to get Ruby.

### Fork and Clone

The first step is to **fork this repository** to your own account at <https://bitbucket.org/codepath/server-api-template>.
Next, you want to clone your version of this repository locally:

```bash
$ git clone git@bitbucket.org:myusername/server-api-template.git
```

**Note:** Be sure to replace `myusername` with your own bitbucket username above.

### Setup

Run the task to install dependencies:

```bash
$ bundle
```

When this is finished, let's start th :

```bash
$ rm -rf .git
$ git init
$ git commit -am "initial commit of my app"
$ git remote add origin git@bitbucket.org:myusername/server-api-template.git
$ git push origin master --force
```

**Note:** Be sure to replace `myusername` with your own bitbucket username above for remote.

## Building APIs

### Design API Endpoints

 - Based on use cases, flesh out API calls needed by mobile client
 - Specify the "type", "url" and "parameters" (i.e "GET /tweets?user_id=5")

### Define Schema

 - Identify resources in your application (i.e user, tweets, favorites)
 - Identify attributes of each resource (i.e a tweet has a body, timestamp)
 - Identify the "associations" for each resource (i.e a tweet has a user_id)

### Create Models

  - Use `rails g model <NAME>` to generate models for each resource
    - `rails g model Tweet`
  - Fill out the "db/migrate/xxxxx" file for each model
  - Fill out associations for each model (i.e `belongs_to :user`)
  - Fill out any validations for each model (i.e `validates :body, :presence => true`)

### Build Grape Resources

  - Check out "app/api/endpoints" for various resource endpoint files
  - Add resources into grape endpoint files
  - Write the API endpoint implementation

## Other Tasks

Here's a list of a few other todos:

  - In "config/initializers/configure_api.rb" configure the username / password for your authenticated APIs
  - In "app/api/api_router.rb" uncomment lines to create basic authenticated endpoints.
  - In "config/environments/production.rb" fill in the real domain for your application
  - In "config/initializers/airbrake.rb" fill in the token for your free airbrake account (for error reporting)

## Deploying

The easiest way to deploy your APIs is to use [Heroku](http://heroku.com).

### Register for an account

First, register yourself a (free) Heroku account at <https://api.heroku.com/signup>. This is
your developer account that can contain any number of free applications.

### Create app

Run the following command in the terminal to create your app:

```bash
$ gem install heroku
$ heroku login
$ heroku create myappname
```

**Note:** Be sure to replace `myappname` with your own application name above.

Be sure to enter your username and password as defined when you created your Heroku account earlier.

### Deploy App

Next it is time to deploy your application:

```bash
$ git push heroku master
```

You may need to type 'yes' when it asks if you want to continue. At this point you should see
Heroku deploying your application to the internet:

```
Warning: Permanently added the RSA host key for IP address '50.19.85.156' to the list of known hosts.
Counting objects: 206, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (184/184), done.
Writing objects: 100% (206/206), 53.24 KiB, done.
Total 206 (delta 70), reused 0 (delta 0)

-----> Ruby/Rails app detected
-----> Installing dependencies using Bundler version 1.3.2
...
```

Wait while this command sets up your application on their servers. Once this is finished, it is time to setup our application on their servers:

### Verify App

Now you can open the url to your app with:

```bash
$ heroku open
```

and now you can visit `/api/vi/sessions` in your browser to confirm this app is running if you see:

```
"This is a sign that the API endpoints are configured"
```

### Wrapping Up ###

At this point you have a deployed API application. If you make changes to your app, simply run:

```bash
$ git add .
$ git commit -am "describe my changes here"
$ git push heroku master
```

and the updated code will be pushed to Heroku accordingly.