# frozen_string_literal: true

class Tabled
  class ConsolePrinter
    attr_reader :table, :table_options

    def initialize(table:, table_options:)
      @table = table
      @table_options = table_options
    end

    def print
      @content = table
                   .console_content
                   .map { |row| row.join(' ') }

      return @content.join("\n") unless table_options[:row_separator]
      return @content.join("\n#{row_separator_line}\n")
    end

    def row_separator_line
      @row_separator_line ||= table_options[:row_separator] * table.rows_width.max
    end
  end
end