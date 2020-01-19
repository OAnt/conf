PASSWD_GIT=$HOME/.pwd
PASSWD_STORE=$PASSWD_GIT/.pwd.zip

function encrypt_passwd(){
	ENC_PASSWD_STORE=$1.enc
	if [ -e "$ENC_PASSWD_STORE" ]
	then
		echo "$ENC_PASSWD_STORE exist, creating backup"
		mv $ENC_PASSWD_STORE $ENC_PASSWD_STORE.bak
	fi
	gpg --output $ENC_PASSWD_STORE --symmetric --no-symkey-cache --cipher-algo AES256 $1
}

function decrypt_passwd(){
	 gpg --output $1 --decrypt $1.enc
	 if [ -e "$1" ]
	 then
		 eval "$2"
		 rm $1
	 else
		 echo "Invalid password"
	 fi
}

function get_passwd(){
	decrypt_passwd $PASSWD_STORE "unzip -p $PASSWD_STORE $1"
}

function list_passwd(){
	decrypt_passwd $PASSWD_STORE "unzip -l $PASSWD_STORE"
}

function add_passwd(){
	NEW=~/.p/new
	mkdir -p ~/.p/new
	pushd $NEW
	if [ -z "$2" ]
	then
		PASSWD=$(pwgen -s 20 -1)
	else
		PASSWD=$2
	fi
	echo "$PASSWD" > $1
	decrypt_passwd $PASSWD_STORE "zip $PASSWD_STORE $1 && encrypt_passwd $PASSWD_STORE"
	rm $1
	popd
	echo $PASSWD
	unset PASSWD
	pushd $PASSWD_GIT
	git add $PASSWD_STORE.enc
	git commit -m "Adding $1 to the list of passwords"
	popd
}
