class Main

  def initialize
    get_args
    @config = ConfigGetter.config
  end

  def main
    @library = ClippingsParser.new(@clippings_path, @config["parser"]).library
    print_stats

    OutputWriter.new(@library, @output_dir, @config["output"]).write_all
  end


  private

  def get_args
    if ARGV.count != 2
      puts "Usage: #{File.basename($0)} my_clippings_path output_dir"
      exit 1
    end

    begin
      @clippings_path = get_path(ARGV[0])
      @output_dir = get_path(ARGV[1])
    rescue SystemCallError => e
      abort(e.message)
    end
  end

  def get_path(path)
    Pathname.new(path).expand_path.realpath
  end

  def print_stats
    puts "=> #{@library.size} books found"
    ct = @library.count_types
    ct.each { |type, n| puts "#{Util::PLURAL[type].capitalize.rjust(12)}: #{n}" }
    puts "-----------------"
    puts "#{"TOTAL".rjust(12)}: #{ct.sum {|k, v| v}}"
  end
end

