class rbenv_passenger::install {

  include 'rbenv'

  if ! defined(Rbenv::Plugin["sstephenson/ruby-build"]) {
    rbenv::plugin { 'sstephenson/ruby-build': }
  }

  if ! defined(Rbenv::Build[$rbenv_passenger::ruby_version]) {
    rbenv::build { $rbenv_passenger::ruby_version: }
  }

  rbenv::gem { 'passenger':
    ruby_version => $rbenv_passenger::ruby_version
  }

  ensure_packages ["libcurl4-openssl-dev"]
}
