#How to set up rails
##install rails
* gem install rails

##create rails app
* rails new 'appname' -d postgresql -T

##set up git
* git init
* git add and commit
* If using gitHub push up to master.

##create the databases
* bin/rake db:create
* bin/rake db:create RAILS_ENV=test
* may need to set the default user in the config/database.yml file.
'''
username: postgres
'''

##set gemfile for testing
* gem 'rspec-rails'
* gem 'capybara'
* bundle
* bin/rails generate rspec:install
* edit .rspec file:

```
--color
--format documentation
--require spec_helper
```
* update spec/rails_helper.rb file with:

```
require 'capybara/rails'
```
* create a 'spec/features' dir and create first 'testName_feature_spec.rb' feature test

##create the routes
* update 'config/routes.rb' with the resources:

```
resources :'resource name as plural'
```
* check routes 'bin/rake routes'

##create controller
*  bin/rails g controller 'ctrlName'
* define the index method in the contoller.

```
def index
    raise 'Hello from the index action'
  end
```
##start the server
* bin/rails server

##create erb view file
```
touch app/views/ctrlName/index.html.erb
```
