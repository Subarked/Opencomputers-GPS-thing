local component = require("component")
local event = require("event")
local keyboard = require("keyboard")
local io = require("io")
local m = component.modem -- get primary modem component
m.open(4001)
print(m.isOpen(4001)) -- true

file = io.open("/home/Position.txt",r)

position = file:read()
-- Wait for a message from another network card.
while not keyboard.isKeyDown("c") do
  local _, _, from, port, distance, message = event.pull("modem_message")
  print("Got a message from " .. from .. " on port " .. port .. " from this far away " .. distance .. " : " .. tostring(message))
  m.broadcast(4001,position)
  os.sleep(0.1)
end
