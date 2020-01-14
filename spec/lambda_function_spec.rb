# frozen_string_literal: true

require_relative '../lambda_function'
require_relative 'code_examples'

def call(data_name)
  actual = lambda_handler(
    event: { 'code' => CodeExamples.send(data_name)[:input] },
    context: 'Ruby Formatting Event'
  )
  expect(actual).to eq(CodeExamples.send(data_name)[:output])
end

RSpec.describe 'lambda_function' do
  context 'called with syntactically breaking snippet' do
    it 'should return a formatting error' do
      call('syntax_error')
    end
  end

  context 'called with syntactically correct snippet' do
    it 'should properly indendent the snippet' do
      call('multiline_with_tabs')
    end

    it 'should add spaces' do
      call('short_method_without_spaces')
    end
  end
end
