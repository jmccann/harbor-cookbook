name             'harbor'
maintainer       'Jacob McCann'
maintainer_email 'jacob.mccann2@target.com'
license          'all_rights'
description      'Installs/Configures harbor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/jmccann/harbor-cookbook'
issues_url       'https://github.com/jmccann/harbor-cookbook/issues'
version          '0.1.0'

depends 'docker', '~> 2.9'
