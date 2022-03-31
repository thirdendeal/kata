module Validation
  ERROR = {
    annotation: 'Error: Solution output is different from annotation',
    code: 'Error: Solution has a non-zero exit status',
    output: 'Error: Solution output is different from expected',
    stderr: 'Error: Solution has a non-empty standard error',
    stdout: 'Error: Solution has no output'
  }

  FATAL = {
    script: 'Error: Solution script is missing'
  }

  # Internal -----------------------------------------------------------

  def error(key, *warning)
    warn(ERROR[key], *warning)

    @error = true
  end

  def fatal(key, *warning)
    warn(FATAL[key], *warning)

    @fatal = true

    raise RuntimeError
  end

  # Assert -------------------------------------------------------------
  #
  # May call fatal

  def assert_source
    fatal(:script, @script) unless @script.extname == '.rb'
  end

  # Check --------------------------------------------------------------
  #
  # May call error

  def check_execute
    error(:stdout) if @stdout.empty?
    error(:stderr, @stderr) unless @stderr.empty?

    error(:code, @code) if @code.nonzero?
  end

  def check_output
    output = @output.pop

    return unless output.exist?

    error(:output, @stdout) if @stdout != output.read
  end

  def check_annotation
    return if @annotation.empty?

    error(:annotation, @stdout) if @stdout != @annotation
  end
end
