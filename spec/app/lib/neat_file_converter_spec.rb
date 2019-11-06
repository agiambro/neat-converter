RSpec.describe NeatFileConverter do
  let(:parent_dir) { '/Users/giambrone/Documents/raw scans/exact-scans/*' }
  let(:subject) { NeatFileConverter.new parent_dir }
  let(:sub_dirs) {
    [
      "/Users/giambrone/Documents/raw scans/exact-scans/Salary",
      "/Users/giambrone/Documents/raw scans/exact-scans/Education",
      "/Users/giambrone/Documents/raw scans/exact-scans/Credit Card"
    ]
  }

  describe '#get_sub_directories' do
    it 'lists all sub directories for a given parent dir' do
      expect(Dir).to receive(:glob) { sub_dirs }
      expect(subject.get_sub_directories).to eq sub_dirs
    end
  end

  describe '#get_files_for' do
    it 'lists all files within a sub directory for a given directory' do
      file_names = ['file-1.pdf', 'file-2.pdf']
      expect(Dir).to receive(:children) { file_names }
      expect(subject.get_files_for('sub_dir')).to eq file_names
    end
  end

  describe '#convert_file_names' do
    xit '' do

    end
  end
end
