module Error
  ERROR = {
    annotation: 'Error: Solution output is different from annotation',
    code: 'Error: Solution has a non-zero exit status',
    output: 'Error: Solution output is different from expected',
    stderr: 'Error: Solution has a non-empty standard error',
    stdout: 'Error: Solution has no output'
  }

  def error(key, *warnings)
    warn(ERROR[key], *warnings) if @verbose

    @failure = true
  end

  def error_check
    @failure = false

    yield

    @failure
  end
end
