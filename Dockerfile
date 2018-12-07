FROM alpine:latest

LABEL "maintainer"="tombrightbill <tombrightbill@gmail.com>"
LABEL "repository"="https://github.com/tombrightbill/terraform-worker"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="Terraform Deploy Workers"
LABEL "com.github.actions.description"="Deploy a Worker with Terraform"
LABEL "com.github.actions.icon"="moon"
LABEL "com.github.actions.color"="yellow"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]