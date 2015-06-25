##JSON Syntax Rules
###JSON syntax is derived from JavaScript object notation syntax:

* Data is in name/value pairs
```
"firstName":"John"
```
* Data is separated by commas
* Curly braces hold objects. Just like JavaScript, JSON objects can contain multiple name/values pairs:
```
{"firstName":"John", "lastName":"Doe"}
```
* Square brackets hold arrays. Just like JavaScript, a JSON array can contain multiple objects: Note in the example you don't need the name 'employees' it can just be an array [..] of objects.
```
"employees":[
    {"firstName":"John", "lastName":"Doe"},
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter","lastName":"Jones"}
]
```
or just an array of stuff
```
[
    {"firstName":"John", "lastName":"Doe"},
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter","lastName":"Jones"}
]
```

##Accessing Json data
* The most common way to access JSON data is through dot notation. This is simply the object name followed by a period and then followed by the name/property you would like to access.
```
var myObject = { 'color' : 'blue' };
document.writeln(myObject.color); // outputs blue.
```
* You can also access JSON data as if it were an Associative Array.
```
var myFirstJSON = { "firstName" : "John",
                    "lastName"  : "Doe",
                    "age"       : 23 };
document.writeln(myFirstJSON["firstName"]);  // Outputs John
document.writeln(myFirstJSON["lastName"]);   // Outputs Doe
document.writeln(myFirstJSON["age"]);        // Outputs 23
```

##Ajax
"The XMLHttpRequest object is part of a technology called Ajax (Asynchronous JavaScript and XML). Using Ajax, data could then be passed between the browser and the server, using the XMLHttpRequest API, without having to reload the web page.
Unfortunately, different browsers implement the Ajax API differently. Typically this meant that developers would have to account for all the different browsers to ensure that Ajax would work universally. Fortunately, jQuery provides Ajax support that abstracts away painful browser differences. It offers both a full-featured $.ajax() method, and simple convenience methods such as $.get(), $.getScript(), $.getJSON(), $.post(), and $().load()."(https://learn.jquery.com/ajax/).

* Callback
You need to pass a callback function to our request; this callback will run when the request succeeds, at which point we can access the data that it returned, if any.
```
$.get( "foo.php", function( response ) {
    console.log( response ); // server response
});
```
* Promise
Promises are a technique for ensuring that certain actions will not execute in JavaScript unless certain conditions have been fulfilled. Immediately this might sound familiar to you as something that usually we simply use callbacks for. Consider the following code that does an AJAX request:
```
get('story.json', function(response) {
  console.log("Success!", response);
});
```
One issue with this code is it doesn't handle errors. We could pass the error into our callback like so:
```
get('story.json', function(error, response) {
  if (error) {
    console.error("Failed!", error);
  }
  else {
    console.log("Success!", response);
  }
});
````
But this will start to get messy, instead use a promise.

Promises take this mess of callback code and give us a way for asyncronous request can be handled effectively and neatly, and at the the time they complete. They work by providing a then function that handles in a much more clean way what to do when our asyncronous request has been completed, and any error handling as well.

Now by getting our get function to use promises we can tidy up the code:
```
get('story.json')
  .then(function(response){
    console.log("Success!", response);
  }, function(error) {
    console.error("Failed!", error);
  });
```
