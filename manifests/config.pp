#
# == Class nscd::config
# Configures nscd:
#
# === Parameters
# [*hosts_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: yes
#
# [*group_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: no
# 
# [*passwd_cache*]
# Set to yes or no, should hosts be cached or not by nscd.
# Default: no
#
# === Authors
# Steve Traylen, CERN, <steve.traylen@cern.ch>
#
class nscd::config ($hosts_cache  = hiera('hosts_cache','yes'),
                    $passwd_cache = hiera('passwd_cache','no'),
                    $group_cache  = hiera('group_cache','no')
                   ) {


     if ! ( $hosts_cache in ['yes','no'] ) {
        fail("hosts_cache must be yes or no")
     }
     if ! ( $passwd_cache in ['yes','no'] ) {
        fail("hosts_cache must be yes or no")
     }
     if ! ( $group_cache in ['yes','no'] ) {
        fail("hosts_cache must be yes or no")
     }


     file{'/etc/nscd.conf':
        ensure  => present,
        content => template('nscd/nscd.conf.erb'),
        require => Package['nscd'],
        notify  => Service['nscd']
     }
}

