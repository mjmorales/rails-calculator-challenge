# Rails Responsive Calculator

## Getting Started
Fork or Clone the Repo to your system.

Run bundle install to install the gem dependencies.

Run puma server in development mode

## Calculator Routes

            root                          GET  /calculators#index
            calculate_calculators GET  /calculators/calculate(.:format) calculators#calculate
            calculators                GET  /calculators(.:format)                calculators#index

root and calculators#index paths call calculators#calculate format: :json through AJAX

# Calculator Requirements
1. The calculator must support at least the following operations: +, -, *(multiplication), /, **(exponentiation), sqrt.

2. Calculations may be performed on the server (preferred ruby on rails) or the client side.  However, no reloading of the page is allowed.

3. The calculator must store the last 10 calculations performed by the user.  The list of calculations must survive a refresh but not necessarily a cookie clear.  The list should be tied to the browser that performed the calculation.  In other words, if a user performs a calculation on Browser A, and then performs a calculation on Browser B, when the app is accessed from Browser A only calculations performed from Browser A should appear and vice versa.

4. The calculator should be able to handle arbitrary precision floats(a "BigDecimal" type).

# Additional Functionality

1. Cursor position is saved on the majority of key strokes and key presses. Paranthetical functions have the cursor moved automatically within paranthesis. 
eg. (cursor position marked by X) 9+3X -> 9+3+4X -> 9+3+4+sqrt(X) -> 9+3+4+sqrt(3X)

2. Enter on the input field submits the current expression.

3. Cookie clearing button at bottom of calculator
