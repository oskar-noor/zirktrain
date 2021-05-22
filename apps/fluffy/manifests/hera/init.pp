class fluffy::athena::init {
  $directories = ['/tmp/fluffy/hera/config','/tmp/fluffy/hera/logs','/tmp/fluffy/hera/junk']

  File {
    ensure => directory,
    owner  => fluffy,
    group  => someusers,
    mode   => '0644',
  }

  file {
    '/tmp/fluffy/hera':
      require => [File['/tmp/fluffy'], User['fluffy']];

    $directories:
      require => [File['/tmp/fluffy/hera'], User['fluffy']];

  }
}
