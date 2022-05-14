local component = require("component")
local event = require("event")
local robot = require("robot")
local energy = require("computer")
local modem = component.modem
local navigation = component.navigation

modem.open(15)

--local commands = {["printFuel"] = function() print("fuel lvl:", component.computer.energy(), "/", component.computer.maxEnergy()) end
--}

--setmetatable(commands, {__index = robot})


function split(s, delimiter)
  local result = {}
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match)
  end
  return result
end

function move(x1, y1, z1, x2, y2, z2)
  end


while true do
  print ("Awaiting next command..")
  
  --local msg = table.pack(event.pull("modem_message"))
  --local command = msg[6]
  
  local _, _, from, port, distance,  message = event.pull("modem_message")

  local splittedString = split(message, " ")
  xStart = splittedString[1]
  yStart = splittedString[2]
  zStart = splittedString[3]
  xStop = splittedString[4]
  yStop = splittedString[5]
  zStop = splittedString[6]
  print(xStart, yStart, zStart, xStop, yStop, zStop)
  
  if message == "forward" then
    robot.forward()
  end

  if message == "back" then
    robot.back()
  end
  
  if message == "pos" then
   print(navigation.getPosition())
  end
  
  if message == "range" then
    print(navigation.getRange())
  end

  if message == "power" then
    print(energy.energy())
  end

  if message == "stopbot" then
    break
  end

 -- if commands[command] then
 --   print("Executing command [".. command .. "]..")
 --   local ok, err = pcall(commands[command])
 --   if not ok then print("Error: ", err) end
 --end
end