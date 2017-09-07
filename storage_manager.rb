class StorageManager
  def stage(identifier)
    move_files(identifier, 'stage')
    [response: "Some response indicating stage request received for #{identifier} goes here"].to_json
  end

  def unstage(identifier)
    move_files(identifier, 'unstage')
    [response: "Some response indicating unstage request received for #{identifier} goes here"].to_json
  end

  def cache_files
    move_files('*', cache)
  end

  private

  def move_files(filespec, action)
    # if action is cache, move the filespec from the ./storage/queue to ./storage/cache
    # if action is stage, copy a stub file from ./storage/archive to ./storage/queue/filespec
    # if action is unstage, remove ./storage/cache/filespec
  end
end