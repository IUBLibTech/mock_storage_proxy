class StorageProxy < Sinatra::Base

  require 'rufus-scheduler'

  configure :development do
    register Sinatra::Reloader
  end

  scheduler = Rufus::Scheduler.new
  scheduler.every '15s' do
    puts 'Checking file request queue'
    # TODO Run a queue management task from here to move files
    # Maybe a rake task?
    # system 'rake queue_mgr'
  end

  get '/' do
    "Some default response goes here"
  end

  get '/some_endpoint/:id' do
    "Response for some_endpoint/#{params['id']} goes here"
  end
end
