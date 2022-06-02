require 'pathname'

class Filter
  attr_accessor :pathnames

  def initialize(paths)
    @pathnames = paths.map do |path|
      Pathname.new(path).expand_path
    end
  end

  def extname(extname)
    @pathnames.filter! do |pathname|
      pathname.extname == extname
    end

    self
  end

  def feeling_lucky(string)
    return self unless string

    @pathnames = @pathnames.filter do |pathname|
      filename = pathname.basename('.*')

      filename.to_s == string
    end

    self
  end

  def under(path)
    root_test =
      Pathname.new(path).expand_path.to_s

    @pathnames.filter! do |pathname|
      pathname.to_s.start_with?(root_test)
    end

    self
  end

  private

  def exact_match(object, pattern)
    string = String(object)

    string == string.match(pattern).to_s
  end
end
