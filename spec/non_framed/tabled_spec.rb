require 'spec_helper'
require 'tabled'
require 'byebug'

describe Tabled do
  let (:raw_data) { Factories::Data.raw }
  let(:raw_data_after_tabled) { Factories::Data.raw_after_tabled }

  describe ".columns_width" do
    it "returns correct columns width" do
      expect(Tabled.new(raw_data).columns_width).to eq([13, 4, 63])
    end
  end

  describe ".content" do
    it "returns list of strings accordingly to given data" do
      expect(Tabled.new(raw_data).content).to eq(raw_data_after_tabled)
    end
  end

  describe ".print_to_console" do
    it "prints table to console" do
      message = raw_data_after_tabled.join("\n")

      expect { Tabled.new(raw_data).print_to_console }.to output(message).to_stdout
    end
  end
end