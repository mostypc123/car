import os
import strutils
import ../color

proc delete*(packages: seq[string]) =
  for pkg in packages:
    let saved = readFile("/etc/car/saves/" & pkg)
    for line in saved.split("\n"):
      if line == "car":
        continue
      discard execShellCmd("rm -f " & line)
    discard execShellCmd("rm -f /etc/car/saves/" & pkg)
  log_ok("deleted all selected packages")
