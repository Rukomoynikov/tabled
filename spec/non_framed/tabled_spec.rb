# frozen_string_literal: true

require 'spec_helper'
require 'tabled'
require 'byebug'

describe Tabled do
  context 'without frame' do
    it 'returns correct columns width' do
      expect(described_class.new(Factories::IncomingData.raw, framed: false).columns_width).to eq([13, 4, 63])
    end

    it 'prints table to console' do
      message = Factories::ProcessedData.with_default_row_separator.join("\n")

      expect do
        described_class.new(Factories::IncomingData.raw, framed: false).print_to_console
      end.to output(message).to_stdout
    end

    context 'with default separator' do
      it 'returns list of strings accordingly to given data' do
        expect(described_class.new(Factories::IncomingData.raw,
                                   framed: false).content).to eq(Factories::ProcessedData.with_default_row_separator)
      end
    end

    context 'with empty separator' do
      it 'returns list of strings accordingly to given data' do
        expect(
          described_class.new(Factories::IncomingData.raw, row_separator: nil, framed: false).content
        ).to eq(
          Factories::ProcessedData.without_row_separator
        )
      end
    end
  end
end
