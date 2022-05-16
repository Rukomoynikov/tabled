# frozen_string_literal: true

class Tabled
  class Template
    class Row
      def self.render(row, columns_width, _is_framed)
        row[0..-2].map.with_index do |column, index|
          spaces = ' ' * (columns_width[index] - column.to_s.size)
          column.to_s + spaces
        end.join
      end
    end

    class RowFooter
      def self.render(row, columns_width, _is_framed)
        return nil unless row.last.fetch(:footer, false)

        footer = row.last.fetch(:footer)
        required_spaces = columns_width.sum - footer.size
        footer + (' ' * required_spaces)
      end
    end
  end
end
