# == Class: module
#
# Full description of class module here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'module':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class ntp( $ntpServerList = $common::data::ntpServerList) {
  package { 'ntp':
  ensure => 'present',
  } #package

  file { '/etc/ntp.conf':
    mode    => "644",
    content => template("ntp/client-ntp.conf.erb"),
    notify  => Service["ntpd"],
    require => Package["ntp"],
  } # file

  service { 'ntpd':
    ensure  => running,
    enable  => true,
    require => Package["ntp"],
  } # service
}

}
