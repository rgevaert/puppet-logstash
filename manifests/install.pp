class logstash::install
{
  # We do not install jre if we don't use the upstream repo.
  # You need to manage it yourselves
  if($logstash::major_release != ''){
    package {
      'openjdk-7-jre-headless':
        ensure => present;
    }
  }

  package {
    $logstash::package:
      ensure => present;
  }
}
