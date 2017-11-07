module Operators
  def eval_operators
    %i(sqrt)
  end

  def sqrt
    [:sqrt, :numeric, -> (value) { value**(0.5) }]
  end
end
