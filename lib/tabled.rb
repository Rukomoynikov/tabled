require 'byebug'
require 'template'

class Tabled
  DEFAULT_OPTIONS = { borders: false }
  attr_accessor :data, :columns_width, :content, :options

  def initialize(data, **options)
    @options = DEFAULT_OPTIONS.merge(options)
    @data = data
    @columns_width = []

    convert_to_required_structure
    calculate_columns_width
    prepare_content
  end


  def print_to_console
    print content.join("\n")
  end

  private

  def convert_to_required_structure
    self.data = data.map { |row|
      row << {} unless row.last.is_a?(Hash)
      row
    }
  end

  def calculate_columns_width
    data.each do |row|
      row_without_params = row[0..-2]
      row_without_params.each_with_index { |column, index|
        is_column_last = row_without_params.count == index + 1
        if is_column_last
          possible_new_value = [row.last.fetch(:footer, '').to_s.size, column.to_s.size].sort.last
          self.columns_width[index] = possible_new_value if possible_new_value > (self.columns_width[index] || 0)
        else
          self.columns_width[index] = column.to_s.size if column.to_s.size > (self.columns_width[index] || 0)
        end
      }
    end

    self.columns_width = columns_width.map { |column_width| column_width + 1 }
  end

  def prepare_content
    self.content = data.inject([]) { |enumerator, row|
      enumerator << Tabled::Template::Row.render(row, columns_width, options)
      enumerator << Tabled::Template::RowFooter.render(row)
    }.compact
  end
end