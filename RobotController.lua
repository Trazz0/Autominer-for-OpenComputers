local term = require "term"
local component = require "component"
local modem = component.modem
local text = require "text"

assert(modem, "huh lol")

local port = 15
robotAddress = "personal-slave-bot"

modem.open(port)

print(port, "is ", modem.isOpen(port))

local running = true

while running do
  print("Enter robot command")
  local command = term.read()
  command = command:gsub("%s+", "")
  command = command:gsub(",", " ")
  print(command)
  if command == "quit" then
    print("TERMINATING PROCESS")
    running = false
    print(running)
  end
  --for i = 1, 50 do
   modem.broadcast(port, command)
  --end
  --modem.send(robotAddress, port, command)
end