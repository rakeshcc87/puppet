class dse{
package { 'dse-full':
   ensure => '4.8.9-1',
   before => Service['dse'],
  }
service  {'dse':
         ensure => running,
         enable => true,
}
file {'/etc/yum.repos.d/cassandra.repo' :
          ensure => file,
          source => ['puppet:///modules/dse/repo'],
          before => Package['dse-full'],
}
file {'/etc/dse/cassandra/cassandra.yaml' :
          ensure => file,
          content => template("dse/cassandra.yaml.erb"),
          before => Service['dse'],
}
notify {"osfamily: $::osfamily":}
notify {"ipaddress1 => $::ipaddress":}
$ipaddress = $::ipaddress
$clustername = "Sumanth_cluster"
$endpoint = "GossipingPropertyFileSnitch"
$authorizer1 = "CassandraAuthorizer"
$authenticator1 = "PasswordAuthenticator" 
}
