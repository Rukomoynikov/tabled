# frozen_string_literal: true

require_relative 'structure/table'
class Tabled
  class ParseContent
    attr_reader :table, :table_options

    def initialize(data, table_options)
      @table = ::Structure::Table.new(data)
      @table_options = table_options
    end

    def rows_width
      titles_width + table.rows_width
    end

    private

    def titles_width
      @titles_width ||= table_options[:titles].map(&:length).sum
      @titles_width.positive? ? [@titles_width] : []
    end
  end
end
