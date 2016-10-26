local function getQueue()
    Queue = {}
    function Queue.new()
        return {first = 0, last = -1}
    end

    function Queue.pushLeft(queue, value)
        local first = queue.first - 1
        queue.first = first
        queue[first] = value
    end

    function Queue.pushRight(queue, value)
        local last = queue.last + 1
        queue.last = last
        queue[last] = value
    end

    function Queue.popLeft(queue)
        local first = queue.first
        if first > queue.last then error("empty queue") end
        local value = queue [first]
        queue[first] = nil
        queue.first = first + 1
        return value
    end

    function Queue.popRight(queue)
        local last = queue.last
        if last < queue.last then error("empty queue") end
        local value = queue [last]
        queue[last] = nil
        queue.last = last + 1
        return value
    end

    return Queue
end
local module = {}
module.getQueue = newQueue
return module
