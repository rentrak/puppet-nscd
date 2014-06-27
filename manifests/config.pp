#
# == Class nscd::config
# Configures nscd:
#
# === Parameters
# [*hosts_cache*]
# Boolean, should hosts be cached or not by nscd.
# Default: false
#
# [*group_cache*]
# Boolean, should hosts be cached or not by nscd.
# Default: false
#
# [*passwd_cache*]
# Boolean, should hosts be cached or not by nscd.
# Default: false
#
# === Authors
# Steve Traylen, CERN, <steve.traylen@cern.ch>
#
class nscd::config (
    $hosts_cache    = hiera('hosts_cache',    false),
    $passwd_cache   = hiera('passwd_cache',   false),
    $group_cache    = hiera('group_cache',    false),
    $services_cache = hiera('services_cache', false)
){
    file { '/etc/nscd.conf':
        ensure  => present,
        content => template('nscd/nscd.conf.erb'),
        require => Package['nscd'],
        notify  => Service['nscd']
    }
}

