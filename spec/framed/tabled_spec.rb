require 'spec_helper'
require 'tabled'
require 'byebug'

describe Tabled do
  context 'without frame' do

    it "returns correct columns width" do
      expect(Tabled.new(Factories::IncomingData.raw).columns_width).to eq([13, 4, 63])
    end

    context 'with default separator' do
      it "returns list of strings accordingly to given data" do
        expect(
          Tabled.new(Factories::IncomingData.raw).content
        ).to eq(
          Factories::ProcessedData.framed_default_row_separator
        )
      end
    end

    context 'with empty separator' do
      it "returns list of strings accordingly to given data" do
        expect(
          Tabled.new(Factories::IncomingData.raw, row_separator: nil).content
        ).to eq(
          Factories::ProcessedData.framed_without_row_separator
        )
      end
    end

    it "prints table to console" do
      message = Factories::ProcessedData.framed_default_row_separator.join("\n")

      expect {
        Tabled.new(Factories::IncomingData.raw).print_to_console
      }.to output(message).to_stdout
    end
  end
end