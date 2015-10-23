class logstash::params
{
  $package         = 'logstash'
  $major_release   = '1.5'
  $config_template = 'logstash/logstash.erb'
  $start_on_boot   = 'yes'
  $memory          = '256m'
  $conf_dir        = '/etc/logstash'
  $confd_dir       = '/etc/logstash/conf.d'
}
