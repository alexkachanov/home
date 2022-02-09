# home
a "home" application for MyInfoServer based on Tomcat.

Put the home.war file into Tomcat webapps folder.

Access the app using <localhost>/home/.

It will show the list of applciations deployed on Tomcat.

Context of this application is using 'privileged="true"' attribute. This allows home application to interact with Tomcat and see the list of Tomcat applications.
