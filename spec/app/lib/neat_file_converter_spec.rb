require 'spec_helper'

RSpec.describe NeatFileConverter do
  let(:parent_dir) { '/Users/giambrone/Documents/raw scans/exact-scans' }
  let(:subject) { NeatFileConverter.new parent_dir }
  let(:sub_dirs) {
    [
      "/Users/giambrone/Documents/raw scans/exact-scans/Sales",
      "/Users/giambrone/Documents/raw scans/exact-scans/Sales/Receipts",
      "/Users/giambrone/Documents/raw scans/exact-scans/Credit Card"
    ]
  }

  describe '#recursive_get_dirs_and_files' do
    it 'lists all sub directories for a given parent dir' do
      expect(subject).to receive(:recursive_get_dirs_and_files) { sub_dirs }
      expect(subject.recursive_get_dirs_and_files).to eq sub_dirs
    end
  end

  describe '#convert_file_names' do
    it 'excludes directories' do
      expect(subject).to receive(:recursive_get_dirs_and_files) { [sub_dirs.first] }
      expect(File).to receive(:directory?) { true }
      expect(Factory).to_not receive(:create_namer)
      expect(subject.convert_file_names)
    end

    it 'excludes directories' do
      factory = double('Factory')
      expect(subject).to receive(:recursive_get_dirs_and_files) { [sub_dirs.first] }
      expect(File).to receive(:directory?) { false }
      expect(Factory).to receive(:create_renamer) { factory }
      expect(factory).to receive(:new_file_name)
      expect(FileUtils).to receive(:mv)
      expect(subject.convert_file_names)
    end
  end
end
