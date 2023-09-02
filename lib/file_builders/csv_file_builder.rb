# frozen_string_literal: true

module FileBuilders
  class CSVFileBuilder
    attr_reader :data, :file_name, :options

    def initialize(data, file_name, options)
      @data = data
      @file_name = file_name
      @options = options
    end

    def export_to_file
      titles_row = (options[:titles].join(';').concat(';').concat("\n") if options[:titles].size.positive?)

      data_without_options = data.map { |row| row[0...-1] }
      csv_data = data_without_options.map { |row| row.join(';').concat(';') }.join("\n")

      File.open(file_name, 'a') do |file|
        file << titles_row
        file << csv_data
      end
    end
  end
end
