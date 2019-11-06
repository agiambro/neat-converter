class Factory
  def self.create_renamer file_name
    if file_name =~ /Document-/
      Document.new file_name
    else
      Receipt.new file_name
    end
  end
end
