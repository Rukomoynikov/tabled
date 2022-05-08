class Tabled
  class Template
    class Row
      def self.render(row, columns_width, options)
        row[0..-2].map.with_index { |column, index|
          spaces = ' ' * (columns_width[index] - column.to_s.size)
          column.to_s + spaces
        }.join('')
      end
    end
  end
end

class Tabled
  class Template
    class RowFooter
      def self.render(row)
        return nil unless row.last.fetch(:footer, false)

        row.last.fetch(:footer)
      end
    end
  end
end