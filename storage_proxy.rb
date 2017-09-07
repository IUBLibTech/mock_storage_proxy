class StorageProxy < Sinatra::Base

  require 'rufus-scheduler'
  require './locater_service.rb'

  configure :development do
    register Sinatra::Reloader
  end

  locater = LocaterService.new

  # This scheduler's job is to move files from queue to the cache to simulate slow file retrieval.
  # A file is put into the queue when staged, but it's just a renamed copy of a stub file.
  # The
  scheduler = Rufus::Scheduler.new
  scheduler.every '15s' do
    puts 'Checking file request queue'
    # TODO Run a queue management method from here to move files found in queue to cache
  end

  get '/' do
    "Some default response goes here"
  end

  get '/status/:id' do
    locater.status(params['id'])
  end

  get '/stage/:id' do
    "Response for some_endpoint/#{params['id']} goes here"
  end

  get '/unstage/:id' do
    "Response for some_endpoint/#{params['id']} goes here"
  end

  get '/fixity/:id' do
    "Response for some_endpoint/#{params['id']} goes here"
  end

  get '/some_other_endpoint/:id' do
    "Response for some_other_endpoint/#{params['id']} goes here"
  end
end
