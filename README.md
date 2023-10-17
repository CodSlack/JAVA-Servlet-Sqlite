# Java-Servlet-Sqlite

## About
This project is a simple ticket-selling website for f1 races powered by Java JSP Servlet. It involves
many edge cases and a solid system architecture. This project is simply a demo demonstrating basic features which is
only the tip of the iceberg. This project might (and certainly does) have bugs, vulnerabilities, or some other types of
issues.

## Features include

```
1. Login and Registration.
2. Admin and Client page
3. Chat between users
```

## Prerequisites
```
What things do you need to install
You need a Tomcat server 8.5 or above installed.
A compatible IDE, Eclipse IDEA recommended for this project.
```
### MVC Architecture
The architecture used for this project looks like this:
![image](https://github.com/Iggor27/Java-Servlet-Sqlite/assets/24782270/4cdd9131-7a03-4ea6-9269-533989f8e304)

## Workspace
Your workspace should look like this:
```
Projekat/
    src/
        main/
            java/
                    beans/ 
                        Karte.java  #Beans
                        Korisnik.java
                        KorisnikDao.java
                        Obradi.java
                    servlet/
                        Admin.java #Servlet
                        Login.java
                        Register.java
                        Staza.java
                webapp/
                        bootstrap/
                        images/
                        database/
                            korisnici.db
                        css/
                            home.css   # css styles
                        home.jsp
                        login.jsp
                        register.jsp
                    WEB-INF/
                      lib/
                        jsp.api.jar
                        jstl-1.2.jar
                        sqlite-jdbc.jar
                      web.xml
    build/
```
