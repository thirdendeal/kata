module Validation
  ERROR = {
    annotation: 'Error: Solution output is different from annotation',
    code: 'Error: Solution has a non-zero exit status',
    output: 'Error: Solution output is different from "output.txt"',
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
    error(:stdout)          if     @stdout.empty?

    error(:stderr, @stderr) unless @stderr.empty?
    error(:code, @code)     unless @status.success?
  end

  def check_output
    success =
      !@output.exist? ||
      @output.read == @stdout

    error(:output, @stdout) unless success
  end

  def check_annotation
    success =
      @annotation.empty? ||
      @annotation == @stdout

    error(:annotation, @stdout) unless success
  end
end
