# frozen_string_literal: true

require_relative 'template'
require_relative 'helpers'
require_relative 'content_shaper'
require_relative 'file_builders/base_file_builder'

class Tabled
  include BaseFileBuilder

  DEFAULT_OPTIONS = { framed: true, row_separator: '-', titles: [] }.freeze
  attr_accessor :data, :data_without_options, :columns_width, :content, :options

  def initialize(data, **options)
    @options = DEFAULT_OPTIONS.merge(options)
    @data = Tabled::Helpers.convert_to_required_structure(data)
    @columns_width = Tabled::Helpers.calculate_columns_width(data: data, options: @options)
    @content = Tabled::ContentShaper.new(data, @columns_width, @options).shape
  end

  def print_to_console
    print content.join("\n")
  end
end
