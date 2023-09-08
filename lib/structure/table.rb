# frozen_string_literal: true

require_relative 'row'
class Structure
  class Table
    attr_reader :rows

    # @param data [Array] Array of Arrays
    def initialize(data)
      raise ArgumentError, 'Data must be an Array' unless data.is_a?(Array)

      @rows = data.map do |raw_row|
        raise ArgumentError, 'Each row must be an Array' unless raw_row.is_a?(Array)

        rows_options = raw_row.last.is_a?(Hash) ? raw_row.last : {}
        row_data = raw_row.last.is_a?(Hash) ? raw_row[0..-2] : raw_row

        ::Structure::Row.new(raw_row: row_data, row_options: rows_options)
      end
    end

    def rows_width
      @rows_width ||= rows.map(&:width)
    end
  end
end
