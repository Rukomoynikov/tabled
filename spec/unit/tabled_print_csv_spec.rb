# frozen_string_literal: true

require 'tabled'
require 'csv'

describe Tabled do
  let(:csv) do
    CSV.parse(<<~ROWS, headers: true)
      Name,Department,Salary
      Bob,Engineering,1000
      Jane,Sales,2000
      John,Management,5000
    ROWS
  end

  describe 'print csv files' do
    it 'accepts a CSV structure' do
      expect(
        described_class.from_csv(csv: csv).columns_width
      ).to eq([5, 12, 7])
    end

    # rubocop:disable RSpec/MessageSpies
    it 'allows to use tabled options' do
      expect(described_class).to receive(:new).with(csv.to_a, row_separator: '__').once

      described_class.from_csv(csv: csv, row_separator: '__')
    end
    # rubocop:enable RSpec/MessageSpies

    context 'when CSV is not valid' do
      it 'raises a format error exception' do
        expect do
          described_class.from_csv(csv: ['Data'])
        end.to raise_error(Tabled::FormatError, 'Expected to receive CSV but received Array')
      end
    end
  end
end
