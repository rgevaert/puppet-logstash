define logstash::configfile (
  $config_template,
  $ensure = present,
) {
  file {
    "${logstash::confd_dir}/${name}":
      ensure   => $ensure,
      content  => template($config_template),
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
      notify   => Class['logstash::service'];
  }
}
