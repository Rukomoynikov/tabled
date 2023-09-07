# frozen_string_literal: true

require 'tabled'

describe 'Export data to CSV file', type: :aruba do
  after do
    FileUtils.rm_f('test.csv')
  end

  context 'when no format provided or format is CSV' do
    it 'creates correct file in the current directory without explicit format' do
      Tabled.new(Factories::IncomingData.raw).export_to_file(file_name: 'test.csv')

      expect(File.exist?('test.csv')).to be true
    end

    it 'creates correct file in the current directory with explicit format' do
      Tabled.new(Factories::IncomingData.raw).export_to_file(file_name: 'test.csv', format: :csv)

      expect(File.exist?('test.csv')).to be true
    end
  end

  it 'content of the created file is valid CSV' do
    Tabled.new(Factories::IncomingData.raw).export_to_file(file_name: 'test.csv')

    csv_content = <<~CSV.chomp
      MethodLength;379;(5682.0 over the limit);
      BlockNesting;414;(0.0 over the limit);
      ClassLength;46;(7098.0 over the limit);
    CSV

    expect(File.read('test.csv')).to eq(csv_content)
  end

  it 'uses passed titles as first row' do
    Tabled.new(Factories::IncomingData.raw,
               titles: ['CopName', 'Metrics', 'Over the limit'])
          .export_to_file(file_name: 'test.csv')

    csv_content = <<~CSV.chomp
      CopName;Metrics;Over the limit;
      MethodLength;379;(5682.0 over the limit);
      BlockNesting;414;(0.0 over the limit);
      ClassLength;46;(7098.0 over the limit);
    CSV

    expect(File.read('test.csv')).to eq(csv_content)
  end

  it 'sends warnings if one of values contains ; symbol' do
    skip('Not implemented yet. Maybe it\'s not really required.')
  end
end
