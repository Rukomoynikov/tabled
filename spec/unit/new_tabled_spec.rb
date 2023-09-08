# frozen_string_literal: true

describe Tabled do
  describe 'rows widths' do
    it 'returns correct rows width' do
      expected_rows_widths = [38, 62, 36]
      calculated_rows_widths = described_class.new(Factories::IncomingData.raw, framed: false).table.rows_width

      expect(calculated_rows_widths).to eq(expected_rows_widths)
    end

    it 'returns correct rows width with passed titles' do
      expected_rows_widths = [20, 38, 62, 36]
      calculated_rows_widths = described_class.new(Factories::IncomingData.raw, framed: false,
                                                                                titles: %w[Name Description Price]).table.rows_width

      expect(calculated_rows_widths).to eq(expected_rows_widths)
    end
  end

  context 'when invalid data is passed' do
    it 'raises an error when data is not an Array' do
      expect do
        Structure::Table.new('not_an_array')
      end.to raise_error(ArgumentError, 'Data must be an Array')
    end

    it 'raises an error when data is not an Array of Arrays' do
      expect do
        Structure::Table.new([['valid_row'], 'invalid_row'])
      end.to raise_error(ArgumentError, 'Each row must be an Array')
    end
  end
end
