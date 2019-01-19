# Client

## Note
Client input file spec is open for interpretation.
I chose the most permissive one (maybe not the most obvious one).

## Specification

- Written in any language except Elixir
- Reads a test input file for commands, each row contains a single command
- Store received checksums and append to final result
- Final output should be concatenated string of checksums

Any unrecognised commands, empty lines or commands that error should be ignored

#### Commands

Add: The row begins with capital letter `A` followed by a number of digits, ex: `A18237283`

Clear: The row begins with capital letter `C`

Checksum: The row begings with letters `CS`

## Test Input

```
C
A24
CS
A47
CS
A1112
CS
C
A90
CS
C
A5218900797
8442
CS
C
A8215529768332323333588123515888912412
CS
C
A11
CS
A11
A11
A11
A11
A11
A11
11
A12
CS
A22222
A33333
CS
A3
CS
```
