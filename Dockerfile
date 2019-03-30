FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install wget libdbd-mysql-perl rsync libaio1 libcurl3 libev4 mysql-client -y && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://www.percona.com/downloads/Percona-XtraBackup-2.4/Percona-XtraBackup-2.4.13/binary/debian/xenial/x86_64/percona-xtrabackup-24_2.4.13-1.xenial_amd64.deb && \
    dpkg -i percona-xtrabackup-24_2.4.13-1.xenial_amd64.deb && \
    rm percona-xtrabackup-24_2.4.13-1.xenial_amd64.deb

WORKDIR /backupdir

ENTRYPOINT ["innobackupex"]