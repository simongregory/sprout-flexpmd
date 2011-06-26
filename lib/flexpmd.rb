require 'sprout'

require 'flexpmd/pmd'
require 'flexpmd/cpd'
require 'flexpmd/metrics'
require 'flexpmd/base'

module FlexPMD 
  NAME    = 'flexpmd'
  JAR_VERSION = '1.2'
  VERSION = "#{JAR_VERSION}.1"
  MD5 = 'efd3fa459788fa3d32837628dc82e264'
  ZIP = 'http://opensource.adobe.com/svn/opensource/flexpmd/maven-repository/release/com/adobe/ac/flex-pmd/1.2/flex-pmd-all-in-one-bundle-1.2.zip'
end

Sprout::Specification.new do |s|

  s.name    = FlexPMD::NAME
  s.version = FlexPMD::JAR_VERSION

  s.add_remote_file_target do |t|
    t.platform     = :universal
    t.archive_type = :zip
    t.url = FlexPMD::ZIP
    t.md5 = FlexPMD::MD5
    t.add_executable :flexpmd, "flex-pmd-command-line-#{FlexPMD::JAR_VERSION}.jar"
    t.add_executable :flexcpd, "flex-pmd-cpd-command-line-#{FlexPMD::JAR_VERSION}.jar"
    t.add_executable :flexmetrics, "flex-pmd-metrics-command-line-#{FlexPMD::JAR_VERSION}.jar"
  end
end
