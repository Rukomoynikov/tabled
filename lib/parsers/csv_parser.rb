# frozen_string_literal: true

require 'csv'
class Tabled
  class CSVParser
    def self.parse(file_path)
      ::CSV.read(file_path)
    end
  end
end
