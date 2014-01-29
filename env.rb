require 'rubygems'
require 'bundler'
require 'json'

Bundler.setup
Bundler.require

ROOT = File.dirname(__FILE__)
TAVERN = 0
AIR = -1
WALL = -2
AIM = {'North' => [-1, 0],
       'East'  => [0, 1],
       'South' => [1, 0],
       'West' => [0, -1]}

Dir.glob(ROOT + '/models/**/*.rb').each do |f|
  require f
end

require './bot'
require './vindinium'
