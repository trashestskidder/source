local createNotification = require(game.ReplicatedStorage.Notification)

hookfunction(createNotification.new, function(message, b)
    workspace:FindFirstChild("status").Value = message
    message = message

    local module = {}
    module.Display = function()
        return message
    end

    return module
end)