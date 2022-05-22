# frozen_string_literal: true

class Tabled
  class Helpers
    # Calculates columns size
    def self.calculate_columns_width(data:, options:)
      columns_width = []

      data.each do |row|
        # [0..-2] Due to reason last item is always hash with row params
        row[0..-2].each_with_index do |column, index|
          columns_width[index] = column.to_s.size if column.to_s.size > (columns_width[index] || 0)
        end
      end

      # If titles longer than data use titles column width
      columns_width.each_with_index do |_column_size, index|
        title_size = options[:titles].fetch(index, '').size

        columns_width[index] = title_size > columns_width[index] ? title_size : columns_width[index]
      end

      # Add 1 space in the end of each column
      columns_width = columns_width.map { |column_width| column_width + 1 }
      # Space in the last column is extra when table isn't framed
      columns_width[-1] = columns_width[-1] - 1 unless options[:framed]

      # Add to the last column footer spaces if needed
      longest_footer_size = # longest footers
        data.map do |row|
          row.last.fetch(:footer, '')
        end.max.to_s.size + 1
      last_col_spaces = longest_footer_size - columns_width.sum # spaces required to the end
      columns_width[-1] = columns_width.last + last_col_spaces if last_col_spaces.positive?

      columns_width
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
