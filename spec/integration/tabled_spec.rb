# frozen_string_literal: true

require 'tabled'

describe Tabled do
  context 'without frame' do
    it 'prints framed table to console when framed option is passed' do
      message = Factories::ProcessedData.with_default_row_separator.join("\n")

      expect do
        described_class.new(Factories::IncomingData.raw, framed: false).print_to_console
      end.to output(message).to_stdout
    end

    it 'prints framed table to console without option' do
      message = Factories::ProcessedData.framed_default_row_separator.join("\n")

      expect do
        described_class.new(Factories::IncomingData.raw).print_to_console
      end.to output(message).to_stdout
    end
  end
end
