# frozen_string_literal: true

require 'tabled'

describe 'Export data to JSON file', type: :aruba do
  let(:tabled) { Tabled }

  context 'when no format provided or format is CSV' do
    after do
      File.delete('test.json') if File.exist?('test.json')
    end

    it 'creates correct file in the current dirrectory' do
      tabled
        .new(Factories::IncomingData.raw, titles: ['Title'])
        .export_to_file(file_name: 'test.json', format: :json)

      expect(File.exist?('test.json')).to be true
    end

    it 'doesn\'t create file when titles are not passed' do
      tabled
        .new(Factories::IncomingData.raw)
        .export_to_file(file_name: 'test.json', format: :json)

      expect(File.exist?('test.json')).to be false
    end

    it 'content of the created file is valid CSV' do
      tabled.new(Factories::IncomingData.raw,
                 titles: ['CopName', 'Metrics', 'Over the limit'])
            .export_to_file(file_name: 'test.json', format: :json)

      csv_content = <<~JSON.chomp
        [
          {
            "CopName": "MethodLength",
            "Metrics": 379,
            "Over the limit": "(5682.0 over the limit)"
          },
          {
            "CopName": "BlockNesting",
            "Metrics": 414,
            "Over the limit": "(0.0 over the limit)"
          },
          {
            "CopName": "ClassLength",
            "Metrics": 46,
            "Over the limit": "(7098.0 over the limit)"
          }
        ]
      JSON

      expect(File.read('test.json')).to eq(csv_content)
    end

    # it 'uses passed titles as first row' do
    #   tabled.new(Factories::IncomingData.raw,
    #              titles: ['CopName', 'Metrics', 'Over the limit'])
    #         .export_to_file(file_name: 'test.csv')

    #   csv_content = <<~CSV.chomp
    #     CopName;Metrics;Over the limit;
    #     MethodLength;379;(5682.0 over the limit);
    #     BlockNesting;414;(0.0 over the limit);
    #     ClassLength;46;(7098.0 over the limit);
    #   CSV

    #   expect(File.read('test.csv')).to eq(csv_content)
    # end

    # it 'sends warnings if one of values contains ; symbol' do
    #   skip('Not implemented yet. Maybe it\'s not really required.')
    # end
  end
end
