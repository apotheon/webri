module WebRI
  #
  def self.metadata
    @metadata ||= (
      require 'yaml'
      YAML.load(File.new(File.dirname(__FILE__) + '/webri.yml'))
    )
  end

  #
  def self.const_missing(name)
    key = name.to_s.downcase
    metadata[key] || super(name)
  end
end

require 'webri/server'
require 'webri/ri_service'
