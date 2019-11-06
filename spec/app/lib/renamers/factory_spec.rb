RSpec.describe Factory do
  describe '.create_renamer' do
    it 'creates a document renamer' do
      file_name = 'Document-xyz.pdf'
      expect(Factory.create_renamer(file_name)).to be_kind_of Document
    end

    it 'creates a document renamer' do
      file_name = 'Receipt-xyz.pdf'
      expect(Factory.create_renamer(file_name)).to be_kind_of Receipt
    end
  end
end
