# frozen_string_literal: true

require 'tabled'

describe Tabled do
  describe 'columns width' do
    it 'returns correct columns width' do
      expect(described_class.new(Factories::IncomingData.raw).columns_width).to eq([13, 4, 46])
    end

    it 'can use terminal colors and it doesn\'t break table' do
      tabled_instance = described_class.new(Factories::IncomingData.raw_with_rainbow,
                                            framed: false)

      expect(tabled_instance.columns_width).to eq([13, 4, 23])
    end
  end

  describe 'list of string in content' do
    it 'returns list of strings accordingly to given data' do
      expect(described_class.new(Factories::IncomingData.raw).content).to eq(Factories::ProcessedData.framed_default_row_separator)
    end

    it 'returns list of strings accordingly to given data when framed is false' do
      expect(described_class.new(Factories::IncomingData.raw,
                                 framed: false).content).to eq(Factories::ProcessedData.with_default_row_separator)
    end

    it 'returns list of strings accordingly to given data + titles' do
      tabled_with_titles = described_class.new(
        Factories::IncomingData.raw,
        titles: ['Cop name', 'Amount of warnings', 'Over the limit']
      )

      expect(
        tabled_with_titles.content
      ).to match_array(Factories::ProcessedData.with_titles)
    end

    it 'returns list of strings accordingly to given data when row separator is nil' do
      expect(
        described_class.new(Factories::IncomingData.raw, row_separator: nil).content
      ).to eq(Factories::ProcessedData.framed_without_row_separator)
    end

    it 'returns list of strings accordingly to given data when row separator is nil and framed is nil' do
      expect(
        described_class.new(Factories::IncomingData.raw, row_separator: nil, framed: false).content
      ).to eq(
        Factories::ProcessedData.without_row_separator
      )
    end
  end
end
