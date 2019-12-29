require 'byebug'

class NeatFileConverter
  DEFAULT_DIR = '/Users/giambrone/Documents/raw scans/exact-scans'

  def initialize parent_dir=DEFAULT_DIR
    @parent_dir = parent_dir
  end

  def convert_file_names
    recursive_get_dirs_and_files.each do |i|
      rename_file i
    end
  end

  def recursive_get_dirs_and_files
    @recursive_get_dirs_and_files ||= Dir.glob("#{@parent_dir}/**/*")
  end


  private

  def rename_file el
    return if File.directory?(el)
    Factory.create_renamer(el).new_file_name
  end
end
