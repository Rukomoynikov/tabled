class Tabled
  class ContentShaper
    attr_accessor :data, :options, :columns_width

    def initialize(data, columns_width, options)
      @data = data
      @columns_width = columns_width
      @options = options
    end

    def shape
      content =
        data
          .inject([]) { |enumerator, row|
            enumerator << Tabled::Template::Row.render(row, columns_width, options[:framed])
            enumerator << Tabled::Template::RowFooter.render(row, columns_width, options[:framed])

            #  Row separator
            unless options[:row_separator].nil?
              enumerator << options[:row_separator].to_s * row_length
            end

            enumerator
          }
          .compact

      content = add_left_and_right_borders(content)
      content = add_top_bottom_borders(content)

      content
    end

    private

    def row_length
      @row_length ||= columns_width.sum
    end

    def add_left_and_right_borders(content)
      content.inject([]) { |enumerator, row|
        # For a row separator all symbols are the same
        row_is_separator = row.split('').uniq.size == 1
        if row_is_separator && !options[:row_separator].nil?
          enumerator << (options[:row_separator] * 2) + row + options[:row_separator]
        elsif !options[:framed]
          enumerator << row
        else
          enumerator << ('| ' if options[:framed]) + row + ('|' if options[:framed])
        end

        enumerator
      }
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