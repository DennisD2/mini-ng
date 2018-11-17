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
For details, see maven-exec-plugin and maven-replacer-plugin sections in pom.xml.
The result of the build is added to the WAR file. For details, see maven-war-plugin section in pom.xml.

The build is activated by the profile ```ng```.
```mvn clean install -P ng```
 
## Compile without build of frontend
This build is faster and simply uses an earlier build result in src/frontend/dist. This does not work if there
has been no build of tghe frontend before.

```mvn clean install```

# How to run
Copy war file from target directory into webapp of a tomcat installation.

# Prerequisites

Download & Install Node.js

###Install Angular CLI
npm install -g @angular/cli

