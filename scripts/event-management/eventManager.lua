eventQueue = require("../utils.queue")
handlers = {}

function register(handler)
  eventType = handler.eventType
  if handlers[eventType] == nil then
      handlers[eventType] = require("../utils.queue")
  end
  handlers[eventType].pushLeft(handler)
end

function notify(handler, event)
  handler.notify(event)
end

function raise(event)
  eventQueue.pushRight(event)
end

function handleEvents(timestamp)
  idx = eventQueue.first
  current = eventQueue[idx]
  while eventQueue[idx] ~= nil then
    event = eventQueue[idx]
    notify(handlers[event.type], event)
    idx += 1
  end
end

local module = {}
module.register = register
module.notify = notify
module.raise = raise
module.handleEvents = handleEvents
return module
