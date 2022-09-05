# Java: Basic Forum Web Application 

This is a basic forum web application built with JDK 17, JSP, Spring Boot, Embedded Apache Tomcat, PostgreSQL and Maven

## Techniques and features of the web application 

- Authentication: Sign up / Sign in
- Handling of user `session`

- Responsive design with `Bootstrap`
- `PostgreSQL` Database to hold user data and postings
  - Java Beans and Database Access Object using Spring Boot (Spring Core + Spring Data)
- HTML `<form>` tags to write a post / sign up / sign in

## Basic level of Security

### SQL Injections
Used `Spring Data JPA + Hibernate` to prevent SQL Injections

## Database Configuration
In `src/main/resources/application.yml` set url, username and password for database connection:
```spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/forum
    username: <username>
    password: <password>
```
`sample` - directory contain sql dump with tables structure and some test data with users


```
Admin
login: admin
password: 12345

User
login: user
password: 12345
```

## Build, package and run application

### Maven
Maven is downloadable as a zip file at https://maven.apache.org/download.cgi. Only the binaries are required, so look for the link to apache-maven-{version}-bin.zip or apache-maven-{version}-bin.tar.gz.
Once you have downloaded the zip file, unzip it to your computer. Then add the bin folder to your path.
To test the Maven installation, run `mvn` from the command-line:
```shell
mvn -v
```
If all goes well, you should be presented with some information about the Maven installation. It will look similar to (although perhaps slightly different from) the following:
```shell
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T16:41:47+00:00)
Maven home: /home/dsyer/Programs/apache-maven
Java version: 1.8.0_152, vendor: Azul Systems, Inc.
Java home: /home/dsyer/.sdkman/candidates/java/8u152-zulu/jre
Default locale: en_GB, platform encoding: UTF-8
OS name: "linux", version: "4.15.0-36-generic", arch: "amd64", family: "unix"
```

### Build Java code
Maven is now ready to build the project. You can execute several build lifecycle goals with Maven now, including goals to compile the project’s code, create a library package (such as a WAR file), and install the library in the local Maven dependency repository.
To try out the build, issue the following at the command line:
```shell
mvn compile
```
This will run Maven, telling it to execute the compile goal. When it’s finished, you should find the compiled .class files in the target/classes directory.
Since it’s unlikely that you’ll want to distribute or work with .class files directly, you’ll probably want to run the package goal instead:
```shell
mvn package
```
The package goal will compile your Java code and finish by packaging the code up in a WAR file within the target directory. The name of the WAR file will be based on the project’s <artifactId> and <version>. For example, given the minimal pom.xml file from before, the WAR file will be named forum-1.0.war.

To execute the JAR file run:
```shell
java -jar target/forum-1.0.war
```
Maven also maintains a repository of dependencies on your local machine (usually in a .m2/repository directory in your home directory) for quick access to project dependencies. If you’d like to install your project’s WAR file to that local repository, then you should invoke the install goal:
```shell
mvn install
```
The install goal will compile, test, and package your project’s code and then copy it into the local dependency repository, ready for another project to reference it as a dependency.
