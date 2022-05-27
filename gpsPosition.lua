local component = require("component")
local event = require("event")
local m = component.modem -- get primary modem component
m.open(4001)
m.open(4002)
m.open(4003)
print(m.isOpen(4001)) -- true
-- Send some message.
m.broadcast(4001, "this is a test")
-- Wait for a message from another network card.
local _, _, from, port, distance, message = event.pull("modem_message")
distanceOne = distance
PositionOne = message
m.broadcast(4002, "this is a test")
local _, _, from, port, distance, message = event.pull("modem_message")
distanceTwo = distance
PositionTwo = message
m.broadcast(4003, "this is a test")
local _, _, from, port, distance, message = event.pull("modem_message")
distanceThree = distance 	
PositionThree = message
