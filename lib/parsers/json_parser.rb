# frozen_string_literal: true

require 'json'
class Tabled
  class JSONParser
    def self.parse(file_path)
      file = File.read(file_path)
      json_entries = ::JSON.parse(file)

      unless json_entries.is_a?(Array) && json_entries.first.is_a?(Hash)
        raise ArgumentError, 'Invalid JSON format. Expected an array of objects.'
      end

      [json_entries.first.keys, json_entries.map(&:values)]
    end
  end
end
