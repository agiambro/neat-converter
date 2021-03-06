require 'chronic'

class Document
  def initialize file_name
    @file_name = file_name
  end

  def new_file_name
    title = parse_title
    date = parse_date
    "#{[title, date].join('-')}.pdf"
  end


  private

  def parse_title
    regex = /Document-(.*)(?=Mon|Tue|Wed|Thu|Fri|Sat|Sun)/
    matches = @file_name.match regex
    title = matches[1].strip
    title.nil? ? title : clean_hyphen_join(title)
  end

  def parse_date
    Chronic.parse(extract_date).strftime('%Y-%m-%d')
  end

  def extract_date
    regex = /(?<=Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s.*?(?=.pdf|ScanSnap)/
    matches = @file_name.match regex
    clean_date = matches[0].strip
  end

  def clean_hyphen_join str
    items = str.split('-')
    return str if items.size == 0
    items.map{|i| i.strip}
  end
end
