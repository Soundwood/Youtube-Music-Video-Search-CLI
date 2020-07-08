# gem dependencies
require 'pry'
require 'httparty'
require 'dotenv/load'
require 'bundler/setup'
Bundler.require

# project dependencies
require_relative "../lib/version"
require_relative "../lib/cli"
require_relative "../lib/youtubeapi"
require_relative "../lib/video"

system("clear")
puts "Environment loaded"