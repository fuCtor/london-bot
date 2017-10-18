require 'bundler/setup'

Bundler.require

ROOT = File.expand_path './../../', __FILE__

$LOAD_PATH << File.join(ROOT, 'lib')
$LOAD_PATH << File.join(ROOT, 'app')

require 'dotenv'
Dotenv.load

require_relative '../app/london'

DB_CONN = Sequel.connect(ENV['DATABASE_URL'])

Dir[File.join(ROOT, 'lib', '*.rb')].each do |fn|
  require fn
end