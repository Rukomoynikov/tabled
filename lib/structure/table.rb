# frozen_string_literal: true

require_relative 'row'
require_relative 'column'

class Structure
  class Table
    attr_reader :rows, :table_options, :columns

    # @param data [Array] Array of Arrays
    def initialize(data:, table_options:)
      raise ArgumentError, 'Data must be an Array' unless data.is_a?(Array)
      raise ArgumentError, 'Options must be a Hash' unless table_options.is_a?(Hash)

      @table_options = table_options

      @rows = data.map do |raw_row|
        raise ArgumentError, 'Each row must be an Array' unless raw_row.is_a?(Array)

        ::Structure::Row.new(raw_row: raw_row, table_instance: self)
      end

      @columns = @rows.map(&:cells).transpose.map do |cells|
        ::Structure::Column.new(cells: cells, table_instance: self)
      end
    end

    def rows_width
      @rows_width ||= titles_width + rows.map(&:width)
    end

    def cells_max_widths
      @cells_max_widths ||= rows.map(&:cells_max_widths).transpose.map(&:max)
    end

    def console_content
      @console_content ||= rows.map(&:console_content)
    end

    private

    def titles_width
      @titles_width ||= table_options[:titles].map(&:length).sum
      @titles_width.positive? ? [@titles_width] : []
    end
  end
end
