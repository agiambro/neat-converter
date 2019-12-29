RSpec.describe Document do
  describe '.new_file_name' do
    context 'title' do
      context 'without spaces' do
        it 'renames' do
          file_name = 'Document-Name Thu Apr 01 2010.pdf'
          expect(Document.new(file_name).new_file_name).to eq 'Name-2010-04-01.pdf'
        end
      end

      context 'with spaces' do
        it 'renames' do
          file_name = 'Document-111 W Street - Lead Based Paint Thu Mar 19 2009.pdf'
          expect(Document.new(file_name).new_file_name).to eq '111 W Street-Lead Based Paint-2009-03-19.pdf'
        end
      end
    end

    context 'with scanner name' do
      it 'renames' do
        file_name = 'Document-111 W Street - return of gifts Fri Apr 27 2012 ScanSnap Manager S1500M.pdf'
        expect(Document.new(file_name).new_file_name).to eq '111 W Street-return of gifts-2012-04-27.pdf'
      end
    end

    context 'with 3 digit day in title' do
      it 'renames' do
        file_name = 'Document-Sunnyside - test Sat Mar 12 2016 ScanSnap Manager S1500M.pdf'
        expect(Document.new(file_name).new_file_name).to eq 'Sunnyside-test-2016-03-12.pdf'
      end
    end
  end
end
