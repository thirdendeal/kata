# Report
# ----------------------------------------------------------------------

KEYS = [
  'Standard Output',
  'Standard Error',
  'Exit Status Code'
]

# ----------------------------------------------------------------------

def report(script, verbose = false)
  scheme = scheme(script)

  scheme.each do |command, expect|
    print("=> #{command}")
    profile = profile(command)

    if verbose
      print("\n")

      verbose_output(expect, profile)
    else
      output(profile)
    end
  end
end

# ----------------------------------------------------------------------

def outline(expect, profile)
  KEYS.each do |key|
    if expect[key] && expect[key] != profile[key]
      puts("-> Expected #{key}")

      puts(expect[key])
    end

    next unless profile[key]

    if expect[key] == profile[key]
      puts("-> #{key} [Expected]")
    else
      puts("-> #{key}")
    end

    puts(profile[key])
  end
end

def output(profile)
  printf(" [%.3f]\n", profile['Real Time'])

  merge =
    profile['Standard Output'].to_s +
    profile['Standard Error'].to_s

  puts(profile['Standard Output']) if merge.empty?
end

def verbose_output(expect, profile)
  printf(
    "-> Real Time\n%.3f\n",
    profile['Real Time']
  )

  outline(expect, profile)
end
