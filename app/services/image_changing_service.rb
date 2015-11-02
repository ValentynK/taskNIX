#require 'RMagick'
require 'find'
class ImageChangingService
  attr_reader :record

  class << self
    def generate_images(record)
      new(record).resize_image
    end

    private :newhttp://localhost:3000/images
  end

 def initialize(record)
   @record = record
 end

  def set_image

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

  def resize_image
    binding.pry
    image = Magick::Image.read(@record.image.path).#.path)
    new_image = image.resize(100, 100)
    return new_image
    binding.pry
  end

  def changing_image_path
    path = @record.image.url.to_s
  end