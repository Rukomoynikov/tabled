class Structure
  class Column
    attr_reader :cells, :table_instance, :is_last

    def initialize(cells:, table_instance:)
      @cells = cells
      @table_instance = table_instance
    end

    def width
      @width ||= @cells.map(&:width).max
    end
  end
end
