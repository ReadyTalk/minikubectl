FROM alpine:3.10

RUN apk update && \
    apk -Uuv add groff less python py2-pip bash jq curl ca-certificates openssl && \
    pip install yq==2.2.0 && \
    apk --purge -v del py2-pip && \
    rm /var/cache/apk/*

ARG VERSION

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
      && chmod +x ./kubectl \
      && mv ./kubectl /usr/local/bin/kubectl \
      && kubectl version --client

