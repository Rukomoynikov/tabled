# frozen_string_literal: true

require 'tabled'

describe 'Export data to JSON file', type: :aruba do
  let(:tabled) { Tabled }

  after do
    FileUtils.rm_f('test.json')
  end

  it 'creates correct file in the current directory' do
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

  it 'content of the created file is valid JSON' do
    tabled.new(Factories::IncomingData.raw,
               titles: ['CopName', 'Metrics', 'Over the limit'])
          .export_to_file(file_name: 'test.json', format: :json)

    json_content = <<~JSON.chomp
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

    expect(File.read('test.json')).to eq(json_content)
  rescue Errno::ENOENT
    fail("Could not read 'test.json'. Ensure the file was created successfully.") # rubocop:disable Style/SignalException
  end
end
