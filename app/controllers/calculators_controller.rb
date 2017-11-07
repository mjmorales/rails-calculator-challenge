require 'calculator'
class CalculatorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def calculate
    response = Calculator.new(calculator_params[:expression]).safe_eval
    respond_to do |format|
      format.json { render(json: calculation_response_hash(response)) }
    end
  end

  private

  def calculator_params
    # Lock down input with strong params
    params.permit(:expression)
  end

  def calculation_response_hash(response)
    # For more easily understood response messages by the user
    # This response hash is redundant if treated as an API Endpoint
    json_response = {}
    json_response[:success] = response[:success] if response[:success]
    json_response[:error] = 'There was an error please retry again.' if response[:errors]
    json_response
  end

end
