# frozen_string_literal: true

require 'spec_helper'
require 'tabled'
require 'byebug'

describe Tabled do
  context 'when framed' do
    it 'returns correct columns width' do
      expect(described_class.new(Factories::IncomingData.raw).columns_width).to eq([13, 4, 46])
    end

    context 'with default separator' do
      it 'returns list of strings accordingly to given data' do
        expect(
          described_class.new(Factories::IncomingData.raw).content
        ).to eq(
          Factories::ProcessedData.framed_default_row_separator
        )
      end
    end

    context 'with empty separator' do
      it 'returns list of strings accordingly to given data' do
        expect(
          described_class.new(Factories::IncomingData.raw, row_separator: nil).content
        ).to eq(
          Factories::ProcessedData.framed_without_row_separator
        )
      end
    end

    context 'with titles' do
      it 'returns list of strings accordingly to given data' do
        tabled_with_titles = described_class.new(
          Factories::IncomingData.raw,
          titles: ['Cop name', 'Amount of warnings', 'Over the limit']
        )

        expect(
          tabled_with_titles.content
        ).to match_array(
          Factories::ProcessedData.with_titles
        )
      end
    end

    it 'prints table to console' do
      message = Factories::ProcessedData.framed_default_row_separator.join("\n")

      expect do
        described_class.new(Factories::IncomingData.raw).print_to_console
      end.to output(message).to_stdout
    end
  end
end
