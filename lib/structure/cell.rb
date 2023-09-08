# frozen_string_literal: true

class Structure
  class Cell
    attr_reader :raw_cell

    def initialize(raw_cell:)
      @raw_cell = raw_cell
    end

    def width
      as_string.size
    end

    private

    def as_string
      raw_cell.to_s
    end
  end
end
