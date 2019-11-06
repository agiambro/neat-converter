require_relative '../../../app/lib/file_renamer'

describe FileRenamer do
  describe '.rename_file' do
    context 'receipt' do
      context 'company' do
        context 'no spaces' do
          it 'renames' do
            file_name = 'Receipt-PBA Mon Jul 01 2019 $91.28.pdf'
            expect(FileRenamer.rename_file(file_name)).to eq 'PBA-2019-07-01-$91.28'
          end
        end

        context 'with spaces' do
          it 'renames' do
            file_name = 'Receipt-A Company Name Test Sun May 01 2011 $93.28.pdf'
            expect(FileRenamer.rename_file(file_name)).to eq 'A Company Name Test-2011-05-01-$93.28'
          end
        end
      end

      context 'amount' do
        context 'standard' do
          it 'renames' do
            file_name = 'Receipt-APP Mon Jul 01 2019 $1.28.pdf'
            expect(FileRenamer.rename_file(file_name)).to eq 'APP-2019-07-01-$1.28'
          end
        end

        context 'none' do
          it 'renames' do
            file_name = 'Receipt-Company 1099 - for taxes Sat Dec 31 2016 Tax.pdf'
            expect(FileRenamer.rename_file(file_name)).to eq 'Company 1099 - for taxes-2016-12-31-'
          end
        end

        context 'with number at end' do
          it 'renames' do
            file_name = 'Receipt-Flag Apple Thu Apr 01 2010 $62.17 1.pdf'
            expect(FileRenamer.rename_file(file_name)).to eq 'Flag Apple-2010-04-01-$62.17 1'
          end
        end
      end
    end
  end
end
