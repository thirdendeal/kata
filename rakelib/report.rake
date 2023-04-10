# Report
# ----------------------------------------------------------------------

KEYS = [
  'Standard Output',
  'Standard Error',
  'Exit Status Code'
]

# ----------------------------------------------------------------------

def report(script)
  scheme = scheme(script)

  scheme.each do |command, expect|
    puts("=> #{command}")
    profile = profile(command)

    printf(
      "-> Real Time\n%.3f\n",
      profile['Real Time']
    )

    outline(expect, profile)
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
      puts("-> #{key} (Expected)")
    else
      puts("-> #{key}")
    end

    puts(profile[key])
  end
end
