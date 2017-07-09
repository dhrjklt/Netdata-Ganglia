
Web Monitoring

OS: CentOS 6.8

Introduction:

Monitor and maintaing webserver and cluster is painfull. Ganglia and Netdata tools are preety easy to implement and maintain.
Nginx webservice is being used to serve both ganglia and netdata applications.


Installation:

1. For Ganglia installation digitalocean tutorial is best

https://www.digitalocean.com/community/tutorials/introduction-to-ganglia-on-ubuntu-14-04

2. For Netdata installation digitalocean tutorial is awesome

 https://www.digitalocean.com/community/tutorials/how-to-set-up-real-time-performance-monitoring-with-netdata-on-ubuntu-16-04

For serving netdata backend and ganglai(apache) we will be using Nginx as our webserver.

For Ganglia:

Change the apache default port 80 to 8001 (/etc/httpd/conf/httpd.conf)

  Just replace by  <Listen 127.0.0.1:8000>
  Check: curl http://127.0.0.1:8000

For Netdata:

   Check: curl http://127.0.0.1:19999


3. Install Nginx : yum install nginx -y

4. 
