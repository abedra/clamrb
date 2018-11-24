FROM centos:latest

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install gcc make pkg-config ruby ruby-devel clamav clamav-lib clamav-devel
RUN pkg-config --list-all
RUN gem install clamrb
