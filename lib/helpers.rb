class Tabled
  class Helpers
    # Calculates columns size
    def self.calculate_columns_width(data)
      columns_width = []

      data.each do |row|
        row_without_params = row[0..-2]
        row_without_params.each_with_index { |column, index|
          is_column_last = row_without_params.count == index + 1
          if is_column_last
            possible_new_value = [row.last.fetch(:footer, '').to_s.size, column.to_s.size].sort.last
            columns_width[index] = possible_new_value if possible_new_value > (columns_width[index] || 0)
          else
            columns_width[index] = column.to_s.size if column.to_s.size > (columns_width[index] || 0)
          end
        }
      end

      columns_width.map { |column_width| column_width + 1 }
    end

    # Add hash as a last element of the row
    def self.convert_to_required_structure(data)
      data.map { |row|
        row << {} unless row.last.is_a?(Hash)
        row
      }
    end
  end
end