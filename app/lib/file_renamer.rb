require 'byebug'
require 'chronic'

class FileRenamer
  def self.rename_file file_name
    company = parse_company file_name
    date = parse_date(extract_date(file_name))
    amount = parse_amount file_name
    [company, date, amount].join('-')
  end


  private

  def self.parse_company file_name
    regex = /Receipt-(.*)(Mon|Tue|Wed|Thu|Fri|Sat|Sun)/
    matches = file_name.match regex
    matches[1].strip
  end

  def self.extract_date file_name
    regex = /(Mon|Tue|Wed|Thu|Fri|Sat|Sun)[^$]*/
    matches = file_name.match regex
    clean_date = matches[0].strip
  end


  def self.parse_date date_string
    Chronic.parse(date_string).strftime('%Y-%m-%d')
  end

  def self.parse_amount file_name
    regex = /(\$.?*).pdf/
    matches = file_name.match regex
    matches[1] if matches
  end
end