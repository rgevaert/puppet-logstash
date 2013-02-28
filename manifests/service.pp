class logstash::service
{
  service{
    'logstash':
      ensure => running;
  }
}
