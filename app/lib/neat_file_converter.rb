require 'byebug'
require 'fileutils'

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
    new_file_name = Factory.create_renamer(el).new_file_name
    new_file_and_path = "#{File.dirname(el)}/#{new_file_name}"
    FileUtils.mv el, new_file_and_path
  end
end
