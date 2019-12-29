require 'chronic'

class Receipt
  def initialize file_name
    @file_name = file_name
  end

  def new_file_name
    company = parse_company
    date = parse_date
    amount = parse_amount
    "#{[company, date, amount].join('-')}.pdf"
  end


  private

  def parse_company
    regex = /Receipt-(.*)(Mon|Tue|Wed|Thu|Fri|Sat|Sun)/
    matches = @file_name.match regex
    matches[1].strip
  end

  def parse_date
    Chronic.parse(extract_date).strftime('%Y-%m-%d')
  end

  def extract_date
    regex = /(?<=Mon|Tue|Wed|Thu|Fri|Sat|Sun).*?(?=-|\$|.pdf)/
    matches = @file_name.match regex
    clean_date = matches[0].strip
    date_only = clean_date.split(' ').take(3).join(' ')
  end

  def parse_amount
    regex = /(\$.?*).pdf/
    matches = @file_name.match regex
    matches[1] if matches
  end
end