eventQueue = require("../utils.queue")
handlers = {}

function register(handler)
    eventType = handler.eventType
    if handlers[eventType] == nil then
        handlers[eventType] = require("../utils.queue")
    end
    handlers[eventType].pushLeft(handler)
end

function notify(event)

end

function raise(event)
end

function handleEvents(timestamp)
end

local module = {}
