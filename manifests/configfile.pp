define logstash::configfile (
  $config_template,
  $ensure = present,
) {
  file {
    "${logstash::conf_dir}/${name}":
      ensure   => $ensure,
      content  => template($config_template),
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
      notify   => Class['logstash::service'];
  }
}
