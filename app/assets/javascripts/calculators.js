var CURRENT_CURSOR_POS = 0;

function modify_calc_expression(calculator, mod) {
  var currentVal = calculator.val();
  if(currentVal.length === 0) {
    calculator.val(mod);
  } else {
    var leftString = currentVal.substr(0, CURRENT_CURSOR_POS);
    var rightString = currentVal.substr(CURRENT_CURSOR_POS, currentVal.length - 1);
    calculator.val(leftString + mod + rightString);
  }

  CURRENT_CURSOR_POS += mod.length;
}

function cursor_position(calculator) {
  return calculator.prop('selectionStart');
}

function calculator_clear(calculator) {
  calculator.val('');
  CURRENT_CURSOR_POS = 0;
}

function submitExpression(calculator) {
  $.get('/calculators/calculate.json',
        { expression: calculator.val() },
        function(data, status){
          calculator_clear(calculator);
          modify_calc_expression(calculator, data.success || 0);
          if(data.error !== undefined){
            flash_message('error', data.error);
          }
        });
}

$(document).ready(function() {
  var calculator = $('.js-calculator-expression');
  calculator.click(function () {
    CURRENT_CURSOR_POS = cursor_position(calculator);
  });

  $('.js-calculator-clear-btn').click(function(){
    calculator_clear(calculator);
  });

  $('.js-calculator-exponent-btn').click(function(){
    modify_calc_expression(calculator, '**()');
    CURRENT_CURSOR_POS -= 1;
  });

  $('.js-calculator-division-btn').click(function(){
    modify_calc_expression(calculator, '/');
  });

  $('.js-calculator-multiplication-btn').click(function(){
    modify_calc_expression(calculator, '*');
  });

  $('.js-calculator-sqrt-btn').click(function(){
    modify_calc_expression(calculator, 'sqrt()');
    CURRENT_CURSOR_POS -= 1;
  });

  $('.js-calculator-subtraction-btn').click(function(){
    modify_calc_expression(calculator, '-');
  });

  $('.js-calculator-addition-btn').click(function(){
    modify_calc_expression(calculator, '+');
  });

  $('.js-calculator-integer-btn').click(function(){
    modify_calc_expression(calculator, $(this).text());
  });

  $('.js-calculator-equals-btn').click(function () {
    submitExpression(calculator);
  })
});
