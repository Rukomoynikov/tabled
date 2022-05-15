require 'byebug'
require_relative './template'

class Tabled
  DEFAULT_OPTIONS = { framed: true, row_separator: '-', spaces_after_value: 1 }
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

    self.columns_width = columns_width.map { |column_width| column_width + @options[:spaces_after_value] }
  end

  def prepare_content
    self.content =
      data
        .inject([]) { |enumerator, row|
          enumerator << Tabled::Template::Row.render(row, columns_width, @options[:framed])
          enumerator << Tabled::Template::RowFooter.render(row, columns_width, @options[:framed])

          #  Row separator
          unless @options[:row_separator].nil?
            enumerator << @options[:row_separator].to_s * row_length
          end

          enumerator
        }
        .compact
        .inject([]) { |enumerator, row|
          # For a row separator all symbols are the same
          row_is_separator = row.split('').uniq.size == 1
          if row_is_separator && !@options[:row_separator].nil?
            enumerator << (@options[:row_separator] * 2) + row + @options[:row_separator]
          elsif !@options[:framed]
            enumerator << row
          else
            enumerator << ('| ' if @options[:framed]) + row + ('|' if @options[:framed])
          end

          enumerator
        }

    #  Top and bottom borders
    if (@options[:framed])
      self.content = [
        '-' * (row_length + 3),
        @options[:row_separator] ? self.content[0..-2] : self.content,
        '-' * (row_length + 3)
      ].flatten
    end
  end

  def row_length
    @row_length ||= columns_width.sum
  end
end