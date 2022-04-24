# frozen_string_literal: true

require 'active_record'
require 'yaml'
require 'erb'

class ApplicationRecord < ActiveRecord::Base
  DB_CONFIG   = YAML.load(ERB.new(File.read(File.expand_path('../../config/database.yaml.erb', __dir__))).result, aliases: true)
  ENVIRONMENT = ENV.fetch('ENV') { 'development' }

  primary_abstract_class
  establish_connection(DB_CONFIG[ENVIRONMENT])

  private_constant :DB_CONFIG
  private_constant :ENVIRONMENT
end
