# frozen_string_literal: true

# Custom errors for the gem
class Tabled::FormatError < StandardError # rubocop:disable Style/ClassAndModuleChildren
  def initialize(received_format:)
    @received_format = received_format
    super
  end

  def message
    "Expected to receive CSV but received #{@received_format}"
  end
end
