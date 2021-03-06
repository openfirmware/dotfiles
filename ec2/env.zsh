if [[ -d "$HOME/.ec2" ]]; then
	export JAVA_HOME="$(/usr/libexec/java_home)"
	export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
	export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
	export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
	export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars"
    export EC2_SSH_PRIVATE_KEY="$HOME/.ssh/id_rsa"
    export EC2_URL="https://ec2.us-west-2.amazonaws.com"
fi
