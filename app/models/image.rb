class Image < ActiveRecord::Base
  attr_accessor :copy_of
  has_attached_file :image,  :styles => { :small => "10x10>" }, :default_url => 'no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :generate_price

  def generate_price
    ::PriseService.generate_prise(self)
  end
end

=begin  #after_save :find_files

  def image_url
    if copy_of
      copy_of.path
    else
      image.path
    end
  end

  def find_files(pwd = Dir.pwd)
    files = []
    begin
      File.find(pwd) do |path|
        Find.prune if path.include? @record.image_file_name
        next unless File.file?(path)
        files << path
      end
    rescue
      puts "Error reading"
    end
    a = files
    #b = MiniMagick::Image.open(image_url)

    binding.pry
  end
  #after_save :make_geometry# :generate_image
  #before_save  :resize
  #def check
 #   check = Magick::Image.read(image).first
  #  return check
   # binding.pry
  #end
  #def make_geometry

   # unless @geometry_saved
    #  self.original_geometry = get_geometry(:original)
     # @geometry_saved = true
      #self.save
      #binding.pry
    #end
  #end

  #def get_geometry(style = :original)
   # begin
    #  Paperclip::Geometry.from_file(image.path(style)).to_s
    #rescue
    #  nil
    #end
  #end
  #def resize
  #  self.image = self.image.resize(100, 100)
  #end
=end



  #def generate_image
  #  ::ImageChangingService.generate_images(self)
 #end
