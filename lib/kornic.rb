require 'date'

require 'kornic/version'
require 'kornic/date_partial'
require 'kornic/parser'

module Kornic
  def self.parse(date_string)
    Kornic::Parser.new(date_string).parse.map(&:guess)
  end
end
