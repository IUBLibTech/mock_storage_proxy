class StorageProxy < Sinatra::Base

  require 'rufus-scheduler'
  require './locater_service.rb'
  require './storage_manager.rb'

  configure :development do
    register Sinatra::Reloader
  end

  locater = LocaterService.new
  storage_mgr = StorageManager.new

  # This scheduler's job is to move files from ./storage/queue to ./storage/cache to simulate slow file retrieval.
  # A file is put into the queue when staged - it's just a renamed copy of a stub file from ./storage/archive.
  scheduler = Rufus::Scheduler.new
  scheduler.every '15s' do
    puts 'Checking file request queue'
    # Move all files found in queue to cache
    storage_mgr.cache_files
  end

  get '/' do
    "Some default response goes here"
  end

  get '/status/:id' do
    locater.status(params['id'])
  end

  get '/stage/:id' do
    storage_mgr.stage(params['id'])
    "Response for some_endpoint/#{params['id']} goes here"
  end

  get '/unstage/:id' do
    storage_mgr.unstage(params['id'])
    "Response for some_endpoint/#{params['id']} goes here"
  end

  get '/fixity/:id' do
    # TODO
  end

  get '/some_other_endpoint/:id' do
    "Response for some_other_endpoint/#{params['id']} goes here"
  end
end
