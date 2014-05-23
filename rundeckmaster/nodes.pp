node default {
       file { "/tmp/puppet-test-file":
         replace => "no", # this is the important property
         ensure  => "present",
         content => "From Puppet\n",
         mode    => 644,
       }

package { "openssh-server": ensure => "installed" }

service	{ "ssh":		ensure => "running",
				enable => "true",
				require => Package["openssh-server"]
}

}
