#!/usr/bin/env ruby
require_relative 'lib/neat_file_converter'
require_relative 'lib/renamers/document'
require_relative 'lib/renamers/factory'
require_relative 'lib/renamers/receipt'

nfc = NeatFileConverter.new
nfc.convert_file_names
