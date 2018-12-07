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

	&& terraform_url=$(curl https://releases.hashicorp.com/ind
	ex.json | jq '{terraform}' | egrep "linux.*amd64" | sort -r
	 | head -1 | awk -F[\"] '{print $4}') \

	&& mkdir terraform && cd terraform \

	&& echo "Downloading $terraform_url." \

	&& curl -o terraform.zip $terraform_url \

	&& unzip terraform.zip \

	&& mv terraform /usr/bin \

	&& rm -rf terraform.zip 

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]