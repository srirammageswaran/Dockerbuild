FROM centos:6.6
MAINTAINER "Sriram Mageswaran K"

ADD https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.6.0-1.el6.x86_64.rpm /root/chef-client.rpm
RUN rpm -Uvh /root/chef-client.rpm
RUN rm -rf /root/chef-client.rpm

RUN mkdir /root/chef

RUN yum install -y initscripts
RUN yum install -y git
RUN yum install -y sudo

RUN git clone https://github.com/srirammageswaran/chef-repo.git /root/chef

RUN chef-solo -E int -o "role["appserver"]" -c /root/chef/solo.rb && service tomcat stop

RUN rm -rf /usr/share/tomcat/conf/context.xml

COPY context.xml /usr/share/tomcat/conf/context.xml

COPY mycompany.war /usr/share/tomcat/webapps/mycompany.war

COPY mysql.jar /usr/share/tomcat/lib/mysql.jar 

EXPOSE 8080


