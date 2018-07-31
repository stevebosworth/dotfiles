if test ! $(which yarn)
then
  local npm_packages = `cat ../Nodefile`
  string_packages=$( printf "%s " "${npm_packages[@]}" )

  echo string_packages
else
  echo 'no yarn installed'
fi
