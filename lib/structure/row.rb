# frozen_string_literal: true

require_relative 'cell'

class Structure
  class Row
    attr_reader :cells, :row_options

    DEFAULT_ROW_OPTIONS = { footer: '' }.freeze

    # @param raw_row [Array] Array of Strings
    # @param row_options [Hash] Hash of options
    def initialize(raw_row:, row_options:)
      @row_options = DEFAULT_ROW_OPTIONS.merge(row_options)

      @cells = raw_row.map do |raw_cell|
        Structure::Cell.new(raw_cell: raw_cell)
      end
    end

    def width
      @width ||= [row_options[:footer].size, cells.map(&:width).sum].max
    end
  end
end
