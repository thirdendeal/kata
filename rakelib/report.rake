# Report
# ----------------------------------------------------------------------

REPORT = {
  time:   'Real Time',

  stdout: 'Standard Output',
  stderr: 'Standard Error',
  status: 'Exit Status Code'
}
# ----------------------------------------------------------------------

def report(capture, expect)
  REPORT.each do |key, message|
    if expect[key] && expect[key] != capture[key]
      puts("-> Expected #{message}")
      puts(expect[key])
    end

    next unless capture[key]

    if expect[key] == capture[key]
      puts("-> #{message} (Expected)")
    else
      puts("-> #{message}")
    end

    puts(capture[key])
  end
end
