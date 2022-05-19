# frozen_string_literal: true

class Tabled
  class Helpers
    # Calculates columns size
    def self.calculate_columns_width(data:, options:)
      columns_width = []

      data.each do |row|
        row_without_params = row[0..-2]
        row_without_params.each_with_index do |column, index|
          is_column_last = row_without_params.count == index + 1
          if is_column_last
            possible_new_value = [row.last.fetch(:footer, '').to_s.size, column.to_s.size].max
            columns_width[index] = possible_new_value if possible_new_value > (columns_width[index] || 0)
          elsif column.to_s.size > (columns_width[index] || 0)
            columns_width[index] = column.to_s.size
          end
        end
      end

      # If titles longer than data use titles column width
      columns_width.each_with_index do |column_size, index|
        title_size = options[:titles].fetch(index, '').size

        columns_width[index] = title_size > columns_width[index] ?  title_size : columns_width[index]
      end

      # Add 1 space in the end of each column
      columns_width.map { |column_width| column_width + 1 }
    end

    # Add hash as a last element of the row
    def self.convert_to_required_structure(data)
      data.map do |row|
        row << {} unless row.last.is_a?(Hash)
        row
      end
    end
  end
end
