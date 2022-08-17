# Function to get sqlsrv and pdo_sqlsrv version.
get_sqlsrv_version() {
  if [[ "${version:?}" =~ 7.[0-3] ]]; then
    echo '5.9.0'
  else
    echo '5.10.0'
  fi
}

add_unixodbc() {
  if [ "$(uname -s)" = 'Linux' ]; then
    install_packages unixodbc-dev
  else
    brew install unixodbc
  fi
}

# Function to install sqlsrv and pdo_sqlsrv.
add_sqlsrv() {
  ext=$1
  ext_version=$(get_sqlsrv_version)
  add_unixodbc 
  add_pecl_extension "$ext" "$ext_version" extension
}
