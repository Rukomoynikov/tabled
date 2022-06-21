# frozen_string_literal: true

describe 'Running tabled from console to print CSV file', type: :aruba do
  context 'when called without file argument' do
    specify do
      expect do
        system('./bin/tabled print')
      end.to output(/File must be provided/).to_stdout_from_any_process
    end
  end

  context 'when file doesn\'t exist' do
    specify do
      expect do
        system('./bin/tabled print file.csv')
      end.to output(/File doesn't exist/).to_stdout_from_any_process
    end
  end

  context 'when file exist' do
    specify do
      expect do
        system('./bin/tabled print spec/fixtures/starwars.csv')
      end.to output(Factories::ProcessedData::Framed.star_wars_list).to_stdout_from_any_process
    end
  end
end
