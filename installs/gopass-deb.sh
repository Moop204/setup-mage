APTITUDE_INSTALL="sudo apt-get install"
CHECK_PACKAGE="dpkg -s"
PACKAGE_INSTALL="sudo dpkg -i"

PREREQ="gnupg2"
FILE="gopass_1.9.0_linux_amd64.deb"
NAME="gopass"

# TODO Check for errors
# TODO Clean in errors
# TODO Clean after success

echo "Installing $NAME..."
if ! $CHECK_PACKAGE $NAME>/dev/null 2>&1; 
then 
  if ! $CHECK_PACKAGE $PREREQ >/dev/null 2>&1; 
  then 
    $APTITUDE_INSTALL $PREREQ
  fi



  if [ ! -e $FILE ]
  then 
    wget https://github.com/gopasspw/gopass/releases/download/v1.9.0/gopass_1.9.0_linux_amd64.deb
  fi 

  if ! $CHECK_PACKAGE $NAME>/dev/null 2>&1; 
  then 
    $PACKAGE_INSTALL $FILE
  fi

  if $CHECK_PACKAGE $NAME>/dev/null 2>&1; 
  then 
    rm $FILE
  fi
fi

