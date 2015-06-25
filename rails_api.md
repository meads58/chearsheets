##Rails API

* resource:  nouns and things and referred to by it's URI its path.
* REST performs action on the resource. It is a pair of requests and responses.
* REST is style and is a representation. http://restful-api-design.readthedocs.org/en/latest/resources.html
* REST requests http://restful-api-design.readthedocs.org/en/latest/methods.html

The 4 REST commands map to the rails actions.

* API how our program talks to another program. http://restful-api-design.readthedocs.org/en/latest/scope.html
* Endpoints - One end of communication channel and usually take the form an URL.

##HTTP response
* Message header: what can be accepted, how and where it came from. The HTTPs transaction operating parameters are defined here.
* Message body: optional and costly.

##Namespace
* in the routes.rb file we add in the Namespace
```
namespace :api do
  resources :todo_lists
end
```
* this will live at api/todo_lists
* this only defines the URI.
* Create a new folder called in 'api' in apps/controller dir.
* In api create the api controller called 'appname_contoller.rb'
* render the json
```
def index
  render json: 'json data'
end

def show
  list = List.find(params[:id])
  render json: list
end
```

##Curl to test api
* boot up server then submit the curl command
```
curl http://localhost:3000/'api url'
```

##Ajax
* Client side javascript to make calls asynchronously to the server.
