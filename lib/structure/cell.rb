# frozen_string_literal: true

class Structure
  class Cell
    attr_reader :raw_cell, :table_instance, :column_index

    def initialize(raw_cell:, table_instance:, column_index:)
      @raw_cell = raw_cell
      @table_instance = table_instance
      @column_index = column_index
    end

    def column
      table_instance.columns[column_index]
    end

    def width
      as_string.size
    end

    def console_content
      @padding ||= column.width - as_string.length

      as_string + (' ' * @padding)
    end

    private

    def column
      table_instance.columns[column_index]
    end

    def as_string
      raw_cell.to_s
    end
  end
end
