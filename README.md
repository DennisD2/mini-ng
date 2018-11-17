# Mini REST web application with Angular frontend
This application comes as a war package.
It contains a minimal REST service and a minimal Angular frontend.
The REST service is implemented using Jersey REST.
 
The WAR file can be deployed in a Tomcat. 

# Dependecies
The dependencies include some modules removed from JDK 9 onwards. 
I assume the eapplication runs on JDK 1.8, 9 10, and 11.

Tested on Tomcat 9.0.13, JDK 10.

# Call example

## REST service call

### Echo endpoint
http://localhost:8080/mini/rest/echo/199

# How to compile and package
mvn clean install

# How to run
Copy war file from target directory into webapp of a tomcat installation.

# Prerequisites

Download & Install Node.js

Install Angular CLI
npm install -g @angular/cli

