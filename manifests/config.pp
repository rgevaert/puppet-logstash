class logstash::config
{
  file {
    $logstash::conf_dir:
      ensure  => directory,
      purge   => true,
      recurse => true;
    '/etc/default/logstash':
      ensure   => present,
      content  => template('logstash/default.erb'),
      owner    => 'root',
      group    => 'root',
      mode     => '0644';
  }
}
