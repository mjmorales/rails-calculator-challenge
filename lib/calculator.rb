require 'calculators/operators'

class Calculator
  include Operators

  attr_accessor :expression, :evaluation

  def initialize(expression)
    dentaku_init
    @expression = expression
    @evaluation = {}
    @logger = Logger.new(STDOUT)
  end

  def safe_eval(debug = false)
    # Errors here should get parsed depending on users and endpoints
    # Debug variable exist for potential future logging
    raise 'unsafe expression string' unless safe_string?
    @evaluation[:success] = @calculator.evaluate(@expression)
    @evaluation
  rescue => e
    # TODO: Parse Dentaku Errors for better Error Messaging
    @logger.debug(e) if debug
    @evaluation[:errors] = 'Invalid expression syntax.'
    @evaluation
  end

  private

  def safe_string?
    @expression.gsub!('**', '^')
    # TODO: Improve Regex matcher to better follow parenth encapsulated items
    @expression[/(sqrt|\+|\-|\/|\(|\)|\d|\*|\^|(\d+\.\d+))*/] == @expression
  end

  def dentaku_init
    @calculator = Dentaku::Calculator.new
    # Additional operators/methods mixed in from Operators Module
    eval_operators.each { |operator| @calculator.add_function(*send(operator)) }
  end

end
