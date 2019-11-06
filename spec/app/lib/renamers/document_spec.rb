RSpec.describe Document do
  describe '.rename_file' do
    context 'title' do
      context 'without spaces' do
        it 'renames' do
          file_name = 'Document-Name Thu Apr 01 2010.pdf'
          expect(Document.new(file_name).rename_file).to eq 'Name-2010-04-01.pdf'
        end
      end

      context 'with spaces' do
        it 'renames' do
        end
      end
    end

    context 'with scanner name' do
      it 'renames' do

      end
    end

    context 'without scanner name' do
      it 'renames' do

      end
    end
  end
end
