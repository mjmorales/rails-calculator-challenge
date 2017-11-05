class CalculatorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def calculate
    # TODO: Create module for expression calculation
    response = 42
    respond_to do |format|
      format.json { render(json: response) }
    end
  end
end
