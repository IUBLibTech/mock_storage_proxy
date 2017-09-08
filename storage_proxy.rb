class StorageProxy < Sinatra::Base

  require 'rufus-scheduler'

  configure :development do
    register Sinatra::Reloader
  end

  # This scheduler's job is to move files from ./storage/queue to ./storage/cache to simulate slow file retrieval.
  # A file is put into the queue when staged - it's just a renamed copy of a stub file from ./storage/archive.
  scheduler = Rufus::Scheduler.new
  scheduler.every '10s' do
    # Move all files found in the queue to the cache
    move_to_cache
  end

  # Endpoint definitions

  get '/' do
    "Some default response goes here"
  end

  get '/status/:id' do
    locate_file(params['id'])
  end

  get '/stage/:id' do
    stage(params['id'])
  end

  get '/unstage/:id' do
    unstage(params['id'])
  end

  get '/fixity/:id' do
    # TODO
  end

  get '/some_other_example_endpoint/:id' do
    "Response for some_other_example_endpoint/#{params['id']} goes here"
  end

  private

  def locate_file(identifier)
    # TODO
    # Check for a string in identifier (like foo) mocking a file unknown condition, return error status.
    # Else check cache in ./storage/cache, return staged status if exists.
    # Else check queue in ./storage/queue, return staging status if exists.
    # Else, return a status indicating it isn't staged but is a valid file that can be.
    [response: "Some response status for #{identifier} goes here"].to_json
  end

  def stage(identifier)
    # TODO
    # Copy ./storage/archive/stub to ./storage/queue/identifier
    [response: "Some response indicating stage request received for #{identifier} goes here"].to_json
  end

  def self.move_to_cache
    puts 'Checking staging queue for files'
    # Sleep so that we don't move new files as soon as they were created - guarantees an asynchronous wait
    sleep 10
    # TODO
    # Move ./storage/queue/* to ./storage/cache
  end

  def unstage(identifier)
    # TODO
    # Remove ./storage/cache/identifier
    [response: "Some response indicating unstage request received for #{identifier} goes here"].to_json
  end
end
