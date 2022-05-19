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
    end
  end

  class ProcessedData
    class << self
      def without_row_separator
        [
          'MethodLength 379 (5682.0 over the limit)                                        ',
          'Footer line 1                                                                   ',
          'BlockNesting 414 (0.0 over the limit)                                           ',
          'One very very long footer, longer then main part! Be carefull!                  ',
          'ClassLength  46  (7098.0 over the limit)                                        '
        ]
      end

      def with_default_row_separator
        [
          'MethodLength 379 (5682.0 over the limit)                                        ',
          'Footer line 1                                                                   ',
          '-----------------------------------------------------------------------------------',
          'BlockNesting 414 (0.0 over the limit)                                           ',
          'One very very long footer, longer then main part! Be carefull!                  ',
          '-----------------------------------------------------------------------------------',
          'ClassLength  46  (7098.0 over the limit)                                        ',
          '-----------------------------------------------------------------------------------'
        ]
      end

      def framed_without_row_separator
        [
          '-----------------------------------------------------------------------------------',
          '| MethodLength 379 (5682.0 over the limit)                                        |',
          '| Footer line 1                                                                   |',
          '| BlockNesting 414 (0.0 over the limit)                                           |',
          '| One very very long footer, longer then main part! Be carefull!                  |',
          '| ClassLength  46  (7098.0 over the limit)                                        |',
          '-----------------------------------------------------------------------------------'
        ]
      end

      def framed_default_row_separator
        [
          '-----------------------------------------------------------------------------------',
          '| MethodLength 379 (5682.0 over the limit)                                        |',
          '| Footer line 1                                                                   |',
          '-----------------------------------------------------------------------------------',
          '| BlockNesting 414 (0.0 over the limit)                                           |',
          '| One very very long footer, longer then main part! Be carefull!                  |',
          '-----------------------------------------------------------------------------------',
          '| ClassLength  46  (7098.0 over the limit)                                        |',
          '-----------------------------------------------------------------------------------'
        ]
      end

      def with_titles
        [
          '--------------------------------------------------------------------------------------------------',
          '| Cop name     Amount of warnings Over the limit                                                 |',
          '--------------------------------------------------------------------------------------------------',
          '| MethodLength 379                (5682.0 over the limit)                                        |',
          '| Footer line 1                                                                                  |',
          '--------------------------------------------------------------------------------------------------',
          '| BlockNesting 414                (0.0 over the limit)                                           |',
          '| One very very long footer, longer then main part! Be carefull!                                 |',
          '--------------------------------------------------------------------------------------------------',
          '| ClassLength  46                 (7098.0 over the limit)                                        |',
          '--------------------------------------------------------------------------------------------------'
        ]
      end
    end
  end
end
