# frozen_string_literal: true

require 'aws-sdk-s3'
require 'rufo'

require 'pry'

def lambda_handler(event:, context:)
  Rufo.format(event['code'])
rescue Rufo::SyntaxError
  'formatting error'
end
