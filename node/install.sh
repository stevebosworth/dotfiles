if ! [ -d "~/.nvm" ]
then
  /bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh)"
fi

if test $(which yarn)
then
  npm_packages=`cat ../Nodefile`
  string_packages=$( printf "%s " "${npm_packages[@]}" )

  echo string_packages
else
  #TODO: Install yarn in this step
  echo 'no yarn installed'
fi
