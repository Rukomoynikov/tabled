# frozen_string_literal: true

require 'tabled'

describe Tabled do
  context 'without frame' do
    it 'returns correct columns width' do
      expect(described_class.new(Factories::IncomingData.raw, framed: false).columns_width).to eq([13, 4, 46])
    end
  end

  it 'returns correct columns width' do
    expect(described_class.new(Factories::IncomingData.raw).columns_width).to eq([13, 4, 46])
  end

  it 'returns list of strings accordingly to given data' do
    expect(
      described_class.new(Factories::IncomingData.raw).content
    ).to eq(
      Factories::ProcessedData.framed_default_row_separator
    )
  end

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

  it 'returns list of strings accordingly to given data' do
    expect(
      described_class.new(Factories::IncomingData.raw, row_separator: nil).content
    ).to eq(
      Factories::ProcessedData.framed_without_row_separator
    )
  end

  it 'can use Rainbow and doesn\'t break table' do
    tabled_instance = described_class.new(Factories::IncomingData.raw_with_rainbow,
                                          framed: false)

    expect(tabled_instance.columns_width).to eq([13, 4, 23])
  end

  it 'returns list of strings accordingly to given data' do
    expect(described_class.new(Factories::IncomingData.raw,
                               framed: false).content).to eq(Factories::ProcessedData.with_default_row_separator)
  end

  it 'returns list of strings accordingly to given data' do
    expect(
      described_class.new(Factories::IncomingData.raw, row_separator: nil, framed: false).content
    ).to eq(
      Factories::ProcessedData.without_row_separator
    )
  end
end
