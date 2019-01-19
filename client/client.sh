#!/bin/sh

sed 's/^A/A /; s/^CS.*/CS/; s/^C[^S].*/C/' $1 | \
while read cmd args rest; do
  case "$cmd" in
    A)
      $(curl -X PATCH localhost:4000/checksum \
        --header "Content-Type: application/json" \
        --fail --silent \
        --data "{\"digits\": \"$args\"}")
      ;;

    C)
      $(curl -X DELETE localhost:4000/checksum --silent)
    ;;

    CS)
      CS=$(curl -X GET localhost:4000/checksum 2>/dev/null | sed 's/{\"checksum\":\(.\)}/\1/')
      case $CS in
        0|1|2|3|4|5|6|7|8|9)
          echo -n $CS
        ;;

        *)
        ;;
      esac
    ;;
    *)
    ;;
  esac
done
echo
