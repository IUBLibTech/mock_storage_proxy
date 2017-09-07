class LocaterService

  def status(identifier)
    status = locateFile(identifier)
    [response: "Some response for #{status} on status/#{identifier} goes here"].to_json
  end

  private

  def locateFile(identifier)
    # TODO
    # Check for a string in identifier (like foo) mocking a file unknown condition, return error status.
    # Else check cache in ./storage/cache, return staged status if exists.
    # Else check queue in ./storage/queue, return staging status if exists.
    # Else, return a status indicating it isn't staged but is a valid file that can be.
    'not staged'
  end
end