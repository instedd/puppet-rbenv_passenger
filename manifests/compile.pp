class rbenv_passenger::compile {

  exec {'compile-passenger':
    command   => "$rbenv::install_dir/versions/$rbenv_passenger::ruby_version/bin/passenger-install-apache2-module -a",
    logoutput => on_failure,
    creates   => $rbenv_passenger::mod_passenger_location,
  }

}
