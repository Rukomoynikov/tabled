# frozen_string_literal: true

require 'tabled'

describe Tabled do
  describe 'Print files' do
    describe 'Running tabled from console to print JSON file', type: :aruba do
      context 'when file exist' do
        specify do
          expect do
            system('./bin/tabled print spec/fixtures/starwars.json')
          end.to output(Factories::ProcessedData::Framed.star_wars_list).to_stdout_from_any_process
        end
      end
    end
  end
end
