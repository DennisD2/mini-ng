# Mini REST web application with Angular frontend
This application comes as a war package.
It contains a minimal REST service and a minimal Angular frontend.
The REST service is implemented using Jersey REST.
 
The WAR file can be deployed in a Tomcat. 

# Dependencies
The dependencies include some modules removed from JDK 9 onwards. 
I assume the application runs on JDK 1.8, 9 10, and 11.

Tested on Tomcat 9.0.13, JDK 10.

# Call example

## Start page
http://localhost:8080/mini-ng

## REST service call

### Echo endpoint
http://localhost:8080/mini-ng/rest/echo/199

# How to compile and package

## Compile including Node.js frontend build
This build includes the build of the frontend into the dist directory and fixes the web context. 
For details, see ```maven-exec-plugin``` and ```maven-replacer-plugin``` sections in pom.xml.
The result of the build is added to the WAR file. For details, see ```maven-war-plugin``` section in pom.xml.

The build is activated by the profile ```ng```.

```mvn clean install -P ng```
 
## Compile without build of frontend
This build is faster and simply uses an earlier build result in src/frontend/dist. This does not work if there
has been no build of the frontend before.

```mvn clean install```

# How to run
Copy war file from target directory into webapp of a tomcat installation.

# Prerequisites
Download & Install Node.js

### Install Angular CLI
```npm install -g @angular/cli```

### CORS issues
As this application runs both frontend and backend in a single war, there is no CORS issue.

If you run the frontent externally using ```ng serve``` and access it via ```localhost:4200```, you will have the CORS issue, because the
backend runs on e.g. ```localhost:8080```. This case may happen during development.

There are several ways to tackle this issue:

* Simplest approach: For Firefox, use "cors-plugin" from Rahudevan to switch off the browsers CORS feature.

* Other approach is to use a proxy configuration for Node.js.

* Other approach is to solve it on server side. The application contains code for that (CORSFilter) and the filter
is activated in ```web.xml```. This should work, but it does not. Other problem with this approach is, that every REST
implementation solves the problem totally different. Even Jersey 1 and 2 are different.



