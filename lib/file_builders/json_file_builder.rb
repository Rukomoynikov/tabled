# frozen_string_literal: true

require 'json'

module FileBuilders
  class JSONFileBuilder
    attr_reader :data, :file_name, :options, :titles

    def initialize(data, file_name, options)
      @data = data
      @file_name = file_name
      @options = options
      @titles = options[:titles]
    end

    def export_to_file
      return puts 'For JSON format titles are required' if titles.size.zero?

      json_data = data.inject([]) do |result, row|
        result << titles.zip(row).to_h
      end

      File.open(file_name, 'a') do |file|
        file << JSON.pretty_generate(json_data)
      end
    end
  end
end
