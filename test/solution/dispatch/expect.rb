module Expect
  def directory(script)
    intake =
      script.parent.glob('input/*.txt')

    result =
      script.parent.glob('output/*.txt')

    intake.zip(result).map do |input, output|
      expect = output.read

      Check.new(script, expect, input: input)
    end
  end

  def script(script)
    expect =
      script
      .read
      .match(/ # => ([[:word:]]*\n)/m)
      &.captures
      &.join

    Check.new(script, expect)
  end
end
