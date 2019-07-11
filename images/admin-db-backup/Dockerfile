ARG mariadb_source_tag=10.3
FROM mariadb:${mariadb_source_tag}

RUN apt-get update && apt-get install -y curl && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y && \
    apt-get clean && \
    rm -rf \
      /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

COPY bin/do-backup.sh /usr/local/bin/
RUN chmod 555 /usr/local/bin/do-backup.sh 

ENTRYPOINT [ "/usr/local/bin/do-backup.sh" ] 
