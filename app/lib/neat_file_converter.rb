require 'byebug'

class NeatFileConverter
  DEFAULT_DIR = '/Users/giambrone/Documents/raw scans/exact-scans/*'

  def initialize parent_dir=DEFAULT_DIR
    @parent_dir = parent_dir
  end

  def convert_file_names
    get_sub_directories.each do |sub_dir|
      get_files_for(sub_dir).each do |f|
        FileRenamer.rename_file f
      end
    end
  end

  def get_sub_directories
    @get_sub_directories ||= Dir.glob("#{@parent_dir}")
  end

  def get_files_for sub_directory
    Dir.children sub_directory
  end
end
