# frozen_string_literal: true

require_relative 'csv_file_builder'
require_relative 'json_file_builder'

module BaseFileBuilder
  def export_to_file(file_name: 'tabled.csv', format: :csv)
    case format
    when :csv
      FileBuilders::CSVFileBuilder.new(data, file_name, options).export_to_file
    when :json
      FileBuilders::JSONFileBuilder.new(data, file_name, options).export_to_file
    else
      raise 'Not implemented yet'
    end
  end
end
