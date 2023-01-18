import std/times
import std/strutils
import digits

proc clearScreen() =
  echo("\x1b[2J")
  echo("\x1b[?25l")

proc main() =
  while true:
    var time = now().format("HH:mm:ss")
    for row in digits.DIGITS:
      for c in time:
        let idx = case c
        of '0'..'9': int(c) - int('0')
        of ':': 10
        of '.': 11
        else: 100
        stdout.write(if idx < row.len: row[idx] else: ' '.repeat(row[0].len))
      echo("")
    stdout.write("\x1b[7A")

when isMainModule:
  clearScreen()
  main()
