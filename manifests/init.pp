class logstash (
  $config_template = $logstash::params::config_template,
  $package         = $logstash::params::package,
  $major_release   = $logstash::params::major_release,
  $start_on_boot   = $logstash::params::start_on_boot,
  $memory          = $logstash::params::memory,
  $conf_dir        = $logstash::params::conf_dir,
  $confd_dir       = $logstash::params::confd_dir,
)
  inherits logstash::params
{
  if($major_release != ''){
    class {
      'logstash::repo':
        major_release => $major_release,
        before        => Class['logstash::install'],
        notify        => Class['logstash::install'];
    }
  }

  class {'logstash::install':;} ~>
  class {'logstash::config':;} ~>
  class {'logstash::service':; }

  logstash::configfile {
    '0_puppet_module.conf':
      config_template => $config_template;
  }
}
