class logstash::params
{
  $package         = 'logstash'
  $start_on_boot   = 'yes'
  $memory          = '256m'
  $conf_dir        = '/etc/logstash/conf.d'
}
