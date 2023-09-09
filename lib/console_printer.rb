# frozen_string_literal: true

class Tabled
  class ConsolePrinter
    attr_reader :table, :options

    def initialize(table, options)
      @table = table
      @options = options
    end

    def print
      @content = table.content
      # print content.join("\n")
    end
  end
end
