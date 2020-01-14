# frozen_string_literal: true

module CodeExamples
  class << self
    def syntax_error
      {
        input: 'def my_method',
        output: 'formatting error'
      }
    end

    def multiline_with_tabs
    {
      input:
'class MultilineParams
def foo(
a: 1
)
a
end
end',
      output: "class MultilineParams\n  def foo(\n          a: 1)\n    a\n  end\nend\n"
    }
    end
    def short_method_without_spaces
      {
        input: 'def HELLO;x=1;end',
        output: "def HELLO; x = 1; end\n"
      }
    end
  end
end
