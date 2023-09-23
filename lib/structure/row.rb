# frozen_string_literal: true

require_relative 'cell'

class Structure
  class Row
    attr_reader :cells, :row_options

    DEFAULT_ROW_OPTIONS = { footer: '' }.freeze

    def initialize(raw_row:, table_instance:)
      @table_instance = table_instance

      @row_options = raw_row.last.is_a?(Hash) ? raw_row.last : {}
      @row_options = DEFAULT_ROW_OPTIONS.merge(@row_options)

      @row_data = raw_row.last.is_a?(Hash) ? raw_row[0..-2] : raw_row

      @cells = @row_data.map.with_index do |raw_cell, index|
        Structure::Cell.new(raw_cell: raw_cell,
                            column_index: index,
                            table_instance: @table_instance)
      end
    end

    def width
      @width ||= [row_options[:footer].size, cells.map(&:width).sum].max
    end

    def cells_max_widths
      @cells_max_widths ||= cells.map(&:width)
    end

    def console_content
      @console_content ||= cells.map(&:console_content)
      @console_content << footer_row if footer_row

      @console_content
    end

    def footer_row
      return if row_options[:footer].empty?

      "\n#{row_options[:footer]} #{' ' * (width - row_options[:footer].size)}"
    end
  end
end
