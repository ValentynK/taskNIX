class PriseService
  attr_reader :record

  class << self
    def generate_prise(record)
      new(record).create_prise
    end

    private :new
  end

 def initialize(record)
   @record = record
 end

  def create_prise
    @prise = 0.001
    @prise += 0.01 if @record.image_file_size > 10_000
    @prise += 0.005 if @record.image_content_type == "image/gif"
    record.price = @prise
   # a = find_files(@record.image_file_name)
  end

  def find_files(pwd = Dir.pwd)
    files = []
    begin
      File.find(pwd) do |path|
        Find.prune if path.include? record.image_file_name
        next unless File.file?(path)
        files << path
      end
    rescue
      puts "Error reading"
    end
    files
  end
  end