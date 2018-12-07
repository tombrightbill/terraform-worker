FROM alpine:latest

LABEL "maintainer"="tombrightbill <tombrightbill@gmail.com>"
LABEL "repository"="https://github.com/tombrightbill/terraform-worker"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="Terraform Deploy Workers"
LABEL "com.github.actions.description"="Deploy a Worker with Terraform"
LABEL "com.github.actions.icon"="moon"
LABEL "com.github.actions.color"="yellow"

RUN apk add --no-cache curl \

	&& apk add --no-cache jq \

	&& terraform_url=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|beta|alpha' | egrep 'linux.*amd64' |tail -1) \

	&& mkdir terraform && cd terraform \

	&& echo "Downloading $terraform_url." \

	&& curl -o terraform.zip $terraform_url \

	&& unzip terraform.zip \

	&& mv terraform /usr/bin \

	&& rm -rf terraform.zip \

	&& pwd

COPY main.tf /github/home/main.tf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]