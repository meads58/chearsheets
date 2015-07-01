#Cucumber

## Testing BDD with Cucumber and Sinatra.

###Setting up Sinatra
* Run ```bundle install``` to pull in all the gems.
* Run ```cucumber-sinatra init --app AppName lib/app_name.rb``` to set up the Unit tests.
* The sinatra controller will be in the lib dir and was created when rspec-sinatra was run.
####Views
* Sinatra will pick up a layout.erb file so add one into the 'views' dir. Include the following in the body of the file:
```<%=yield%>```
* In the views folder add in an index.erb file.
* In the controller from inside the App class point to the views dir with:
```set :views, Proc.new { File.join(root, "..", "views") }```
* Render the index view like this:
```
get '/' do
  erb :index
end
```
* Run ```rackup``` to view the localhost.
####Sessions
* enable sessions in the controller class to keep state during requests with:
```enable :sessions```
####Flash
* Allows messages to appear e.g. 'invalid error message'
* Add in the gem ```gem 'rack-flash3' ``` and add in ```require 'rack-flash'``` to the top of the controller and ``` use Rack::Flash```` into the class.

####Datamapper
* Add in the postgresql gem ```gem 'dm-postgres-adapter' ```

###Cucumber
* Feature files are put in the Features dir with the format 'name_of_test.feature' Cucumber looks for '.feature' files.
