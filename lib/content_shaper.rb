# frozen_string_literal: true

class Tabled
  class ContentShaper
    attr_accessor :data, :options, :columns_width

    def initialize(data, columns_width, options)
      @data = data
      @columns_width = columns_width
      @options = options
    end

    def shape
      content = []

      unless options[:titles].empty?
        content << Tabled::Template::Titles.render(options[:titles], columns_width, options[:framed])
        content << (options[:row_separator].to_s * row_length) unless options[:row_separator].nil?
      end

      content.concat(
        data
        .each_with_object([]) do |row, enumerator|
          enumerator << Tabled::Template::Row.render(row, columns_width, options[:framed])
          enumerator << Tabled::Template::RowFooter.render(row, columns_width, options[:framed])

          #  Row separator
          enumerator << (options[:row_separator].to_s * row_length) unless options[:row_separator].nil?
        end
        .compact
      )

      content = add_left_and_right_borders(content)
      add_top_bottom_borders(content)
    end

    private

    def row_length
      @row_length ||= columns_width.sum
    end

    def add_left_and_right_borders(content)
      content.each_with_object([]) do |row, enumerator|
        # For a row separator all symbols are the same
        row_is_separator = row.chars.uniq.size == 1
        enumerator << if row_is_separator && !options[:row_separator].nil?
                        (options[:row_separator] * 2) + row + options[:row_separator]
                      elsif !options[:framed]
                        row
                      else
                        ('| ' if options[:framed]) + row + ('|' if options[:framed])
                      end
      end
    end

    def add_top_bottom_borders(content)
      #  Top and bottom borders
      if options[:framed]
        [
          '-' * (row_length + 3),
          options[:row_separator] ? content[0..-2] : content,
          '-' * (row_length + 3)
        ].flatten
      else
        content
      end
    end
  end
end
