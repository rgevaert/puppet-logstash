class logstash::install
{
  package {
    $logstash::package:
      ensure => present;
  }
}
