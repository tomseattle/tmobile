node default {
  include common
    class {'ntp':
      ntpServerList => ['127.127.1.0']
      ntpServerList => ['0.rhel.pool.ntp.or']
    }
}
