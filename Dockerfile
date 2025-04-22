FROM rocker/tidyverse:latest

# 🔧 INSTALL JAVA (for Sparklyr)
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# 📦 R packages
RUN R -e "install.packages(c('sparklyr', 'survival', 'EHR'), repos='http://cran.rstudio.com/')"

# 🔁 Working directory and volume mount
RUN mkdir /home/rstudio/data
WORKDIR /home/rstudio

EXPOSE 8787
