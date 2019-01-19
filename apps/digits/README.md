# Digits

## Regarding BONUS

The most obvious way to address timeout in call to GenServer is `GenServer.call/3`
third argument.
But using this mechanism on "read" (checksum computation does not alter state) 
operation has consequences:
if checksum is not computed within timeout, state is lost!
