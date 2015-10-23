class logstash::repo ($major_release) {

  apt::key {
    'elasticsearch.org-logstash':
      source => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch';
  }

  $repo = $::operatingsystem ? {
        'Debian' => "deb http://packages.elasticsearch.org/logstash/${major_release}/debian stable main",
        'Ubuntu' => "deb http://packages.elasticsearch.org/logstash/${major_release}/debian stable main",
        default  => fail("${::operatingsystem} not supported in logstash::repo")
  }

  apt::sources_list {
    'logstash':
      ensure  => present,
      content => $repo,
      require => Apt::Key['elasticsearch.org-logstash'];
  }

}
