# frozen_string_literal: true

require_relative 'cell'

class Structure
  class Row
    attr_reader :cells, :row_options

    DEFAULT_ROW_OPTIONS = { footer: '' }.freeze

    def initialize(raw_row:)
      @row_options = raw_row.last.is_a?(Hash) ? raw_row.last : {}
      @row_options = DEFAULT_ROW_OPTIONS.merge(@row_options)

      @row_data = raw_row.last.is_a?(Hash) ? raw_row[0..-2] : raw_row

      @cells = @row_data.map do |raw_cell|
        Structure::Cell.new(raw_cell: raw_cell)
      end
    end

    def width
      @width ||= [row_options[:footer].size, cells.map(&:width).sum].max
    end

    def cells_max_widths
      @cells_max_widths ||= cells.map(&:width)
    end
  end
end
