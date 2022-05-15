class Factories
  class Data
    class << self
      def raw
        [
          ["MethodLength", 379, "(5682.0 over the limit)", { footer: "Footer line 1\nFooter line 2" }],
          ["BlockNesting", 414, "(0.0 over the limit)", { footer: "One very very long footer, longer then main part! Be carefull!" }],
          ["ClassLength", 46, "(7098.0 over the limit)"]
        ]
      end

      def raw_after_tabled
        [
          "MethodLength 379 (5682.0 over the limit)                                        ",
          "Footer line 1\nFooter line 2",
          "BlockNesting 414 (0.0 over the limit)                                           ",
          "One very very long footer, longer then main part! Be carefull!",
          "ClassLength  46  (7098.0 over the limit)                                        "
        ]
      end
    end
  end
end