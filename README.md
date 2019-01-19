# Checksum

## Checksum API

- Written in Elixir
- Assume this is part of a bigger project rather than a code kata when it comes to design & code quality
- Provides a HTTP Rest or GraphQL API
- Outputs JSON
- No auth necessary
- Should not rely on a database
- Does not require state persistence between restarts

The API should provide the following functionality:

#### Add numbers

Ability to accept an arbitrary number of digits which should be appended to any previously received digits to form a long number.

#### Clear numbers

Ability to clear the previously received list of digits

#### Get checksum

Calculates a checksum given the current state and returns it

BONUS - For bonus points return a timeout response if checksum can't be calculated in less than 15ms

### Checksum calculation

1. Add up the digits in odd positions and multiply by 3
2. Add up the digits in even positions
3. Add up the results of 1 and 2
4. Divide by 10 and take the remainder.
5. If the remainder is 0 final result is 0 otherwise subtract it from 10 for final result

#### Example:

5 4 8 9 8 5 0 3 5 4

1. 5 + 8 + 8 + 0 + 5 = 26 * 3 = 78
2. 4 + 9 + 5 + 3 + 4 = 25
3. 78 + 25 = 103
4. 103 / 10 = 10.3 = 3
5. 10 - 3 = 7
