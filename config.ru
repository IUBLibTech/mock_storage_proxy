require 'bundler'
require 'rufus-scheduler'
Bundler.require

require './storage_proxy'

run StorageProxy
