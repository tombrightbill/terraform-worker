apk add --no-cache curl

apk add --no-cache jq

terraform_url=$(curl https://releases.hashicorp.com/ind
ex.json | jq '{terraform}' | egrep "linux.*amd64" | sort -r
 | head -1 | awk -F[\"] '{print $4}')

mkdir terraform && cd terraform

# Download Terraform. URI: https://www.terraform.io/downloads.html

echo "Downloading $terraform_url."

curl -o terraform.zip $terraform_url

# Unzip and install
unzip terraform.zip

#Move binary
mv terraform /usr/bin

#Clean up
rm -rf terraform.zip

terraform 