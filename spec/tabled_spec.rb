require 'spec_helper'
require_relative '../lib/tabled'
require 'byebug'

describe Tabled do
  let (:raw_data) {
    [
      ["MethodLength", 379, "(5682.0 over the limit)", { footer: "Footer line 1\nFooter line 2" }],
      ["BlockNesting", 414, "(0.0 over the limit)", { footer: "One very very long footer, longer then main part! Be carefull!" }],
      ["ClassLength", 46, "(7098.0 over the limit)"]
    ]
  }

  describe ".columns_width" do
    it "returns correct columns width" do
      expect(Tabled.new(raw_data).columns_width).to eq([13, 4, 63])
    end
  end

  describe ".content" do
    it "returns list of strings accordingly to given data" do
      expect(Tabled.new(raw_data).content).to eq(
        [
          "MethodLength 379 (5682.0 over the limit)                                        ",
          "Footer line 1\nFooter line 2",
          "BlockNesting 414 (0.0 over the limit)                                           ",
          "One very very long footer, longer then main part! Be carefull!",
          "ClassLength  46  (7098.0 over the limit)                                        "]
      )
    end
  end

  describe ".print_to_console" do
    it "prints table to console" do
      expect {
        Tabled.new(raw_data).print_to_console
      }.to output.to_stdout
    end
  end
end