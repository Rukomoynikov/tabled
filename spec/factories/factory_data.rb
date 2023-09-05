# frozen_string_literal: true

class Factories
  class IncomingData
    class << self
      def raw
        [
          ['MethodLength', 379, '(5682.0 over the limit)', { footer: 'Footer line 1' }],
          ['BlockNesting', 414, '(0.0 over the limit)',
           { footer: 'One very very long footer, longer then main part! Be carefull!' }],
          ['ClassLength', 46, '(7098.0 over the limit)']
        ]
      end

      def raw_with_rainbow
        [
          ['MethodLength', "\e[31m379\e[0m", '(5682.0 over the limit)']
        ]
      end
    end
  end

  class ProcessedData
    class Framed
      class << self
        def star_wars_list
          ['------------------------------',
           '| name           height mass |',
           '------------------------------',
           '| Luke Skywalker 172     11  |',
           '------------------------------',
           '| C-3PO          167    75   |',
           '------------------------------',
           '| R2-D2          96     32   |',
           '------------------------------',
           '| Darth Vader    202    136  |',
           '------------------------------',
           '| Leia Organa    150    49   |',
           '------------------------------',
           '| Owen Lars      178    120  |',
           '------------------------------'].join("\n")
        end
      end
    end

    class << self
      def without_row_separator
        [
          'MethodLength 379 (5682.0 over the limit)                       ',
          'Footer line 1                                                  ',
          'BlockNesting 414 (0.0 over the limit)                          ',
          'One very very long footer, longer then main part! Be carefull! ',
          'ClassLength  46  (7098.0 over the limit)                       '
        ]
      end

      def with_default_row_separator
        [
          'MethodLength 379 (5682.0 over the limit)                       ',
          'Footer line 1                                                  ',
          '---------------------------------------------------------------',
          'BlockNesting 414 (0.0 over the limit)                          ',
          'One very very long footer, longer then main part! Be carefull! ',
          '---------------------------------------------------------------',
          'ClassLength  46  (7098.0 over the limit)                       ',
          '---------------------------------------------------------------'
        ]
      end

      def framed_without_row_separator
        [
          '------------------------------------------------------------------',
          '| MethodLength 379 (5682.0 over the limit)                       |',
          '| Footer line 1                                                  |',
          '| BlockNesting 414 (0.0 over the limit)                          |',
          '| One very very long footer, longer then main part! Be carefull! |',
          '| ClassLength  46  (7098.0 over the limit)                       |',
          '------------------------------------------------------------------'
        ]
      end

      def framed_default_row_separator
        [
          '------------------------------------------------------------------',
          '| MethodLength 379 (5682.0 over the limit)                       |',
          '| Footer line 1                                                  |',
          '------------------------------------------------------------------',
          '| BlockNesting 414 (0.0 over the limit)                          |',
          '| One very very long footer, longer then main part! Be carefull! |',
          '------------------------------------------------------------------',
          '| ClassLength  46  (7098.0 over the limit)                       |',
          '------------------------------------------------------------------'
        ]
      end

      def with_titles
        [
          '------------------------------------------------------------------',
          '| Cop name     Amount of warnings Over the limit                 |',
          '------------------------------------------------------------------',
          '| MethodLength 379                (5682.0 over the limit)        |',
          '| Footer line 1                                                  |',
          '------------------------------------------------------------------',
          '| BlockNesting 414                (0.0 over the limit)           |',
          '| One very very long footer, longer then main part! Be carefull! |',
          '------------------------------------------------------------------',
          '| ClassLength  46                 (7098.0 over the limit)        |',
          '------------------------------------------------------------------'
        ]
      end
    end
  end
end
