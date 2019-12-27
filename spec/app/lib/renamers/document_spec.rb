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
          file_name = 'Document-111 W Street - Lead Based Paint Thu Mar 19 2009.pdf'
          expect(Document.new(file_name).rename_file).to eq '111 W Street-Lead Based Paint-2009-03-19.pdf'
        end
      end
    end

    context 'with scanner name' do
      it 'renames' do
        file_name = 'Document-111 W Street - return of gifts Fri Apr 27 2012 ScanSnap Manager S1500M.pdf'
        expect(Document.new(file_name).rename_file).to eq '111 W Street-return of gifts-2012-04-27.pdf'
      end
    end
  end
end
