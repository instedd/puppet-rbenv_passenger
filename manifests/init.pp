class rbenv_passenger(
  $ruby_version = undef,
  $passenger_version = "4.0.37"
) {

  $passenger_ruby = "$rbenv::install_dir/shims/ruby"
  $passenger_root = "$rbenv::install_dir/versions/$rbenv_passenger::ruby_version/lib/ruby/gems/1.9.1/gems/passenger-$passenger_version"
  $mod_passenger_location = "$passenger_root/buildout/apache2/mod_passenger.so"

  include '::apache'
  include '::apache::dev'

  include '::rbenv_passenger::install'
  include '::rbenv_passenger::compile'
  include '::rbenv_passenger::config'

  anchor { 'rbenv_passenger::begin': }
  anchor { 'rbenv_passenger::end': }

  Anchor['rbenv_passenger::begin'] ->
  Class['apache::dev'] ->
  Class['rbenv_passenger::install'] ->
  Class['rbenv_passenger::compile'] ->
  Class['rbenv_passenger::config'] ->
  Anchor['rbenv_passenger::end']

}
