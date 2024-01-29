FROM jenkins/jenkins

USER root
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" ; \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" ; \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check ;\
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl ; \
    # install helm
    curl -LO https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz ; \
    tar xvf helm-v3.9.3-linux-amd64.tar.gz ; \
    mv linux-amd64/helm /usr/local/bin
