require 'sprout'

require 'flexpmd/base'
require 'flexpmd/pmd'
require 'flexpmd/cpd'
require 'flexpmd/metrics'
require 'flexpmd/version'

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
