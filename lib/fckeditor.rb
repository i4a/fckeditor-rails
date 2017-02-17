require 'fckeditor/version'

module Fckeditor

  def self.gem_path
    Pathname(File.realpath(__FILE__)).join('../..')
  end

  def self.gem_spec
    Gem::Specification::load(
      gem_path.join('fckeditor-rails.gemspec').to_s
    )
  end

  def self.load_paths
    ['app/assets', 'app/controllers'].flat_map do |path|
      gem_path.join(path).each_child.to_a
    end
  end

  def self.dependencies
    []
  end

  if defined?(Rails)
    class Engine < ::Rails::Engine
      # Rails -> use app/assets directory.
    end
  end

end

class RailsAssets
  @components ||= []

  class << self
    attr_accessor :components

    def load_paths
      components.flat_map(&:load_paths)
    end
  end
end

RailsAssets.components << Fckeditor
