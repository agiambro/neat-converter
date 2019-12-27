class Document
  def initialize file_name
    @file_name = file_name
  end

  def rename_file
    title = parse_title
    date = parse_date
    "#{[title, date].join('-')}.pdf"
  end


  private

  def parse_title
    regex = /Document-(.*)(Mon|Tue|Wed|Thu|Fri|Sat|Sun)/
    matches = @file_name.match regex
    matches[1].strip
  end

  def parse_date
    Chronic.parse(extract_date).strftime('%Y-%m-%d')
  end

  def extract_date
    regex = /(Mon|Tue|Wed|Thu|Fri|Sat|Sun)[^.$]*/
    matches = @file_name.match regex
    clean_date = matches[0].strip
  end
end
