RSpec.describe Receipt do
  describe '.new_file_name' do
    context 'company' do
      context 'wihtout spaces' do
        it 'renames' do
          file_name = 'Receipt-PBA Mon Jul 01 2019 $91.28.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'PBA-2019-07-01-$91.28.pdf'
        end
      end

      context 'with spaces' do
        it 'renames' do
          file_name = 'Receipt-A Company Name Test Sun May 01 2011 $93.28.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'A Company Name Test-2011-05-01-$93.28.pdf'
        end
      end
    end

    context 'amount' do
      context 'standard' do
        it 'renames' do
          file_name = 'Receipt-APP Mon Jul 01 2019 $1.28.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'APP-2019-07-01-$1.28.pdf'
        end
      end

      context 'none' do
        it 'renames' do
          file_name = 'Receipt-Company 1099 - for taxes Sat Dec 31 2016 Tax.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'Company 1099 - for taxes-2016-12-31-.pdf'
        end
      end

      context 'with number at end' do
        it 'renames' do
          file_name = 'Receipt-Flag Apple Thu Apr 01 2010 $62.17 1.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'Flag Apple-2010-04-01-$62.17 1.pdf'
        end
      end

      context 'with hyphen before' do
        it 'renames' do
          file_name = 'Receipt-Best Buy Mon Aug 31 2009 -$10.25.pdf'
          expect(Receipt.new(file_name).new_file_name).to eq 'Best Buy-2009-08-31-$10.25.pdf'
        end
      end
    end
  end
end
