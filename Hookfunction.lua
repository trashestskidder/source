local ReplicatedStorage = game:GetService("ReplicatedStorage")
local task = task or require(ReplicatedStorage:WaitForChild("task"))
task.spawn(function()
    local Container = ReplicatedStorage:WaitForChild("Effect"):WaitForChild("Container")
    local CameraShaker = require(ReplicatedStorage.Util:WaitForChild("CameraShaker"))
    local Death, Respawn = require(Container.Death), require(Container.Respawn)
    local GuideModule = require(game.ReplicatedStorage:WaitForChild("GuideModule")).ChangeDisplayedNPC
    hookfunction(Death, function() 
        return nil 
    end)
    hookfunction(Respawn, function() 
        return nil 
    end)
    hookfunction(GuideModule, function()
        return false
    end)
    CameraShaker:Stop()
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then 
                v.Enabled = false 
            end
        end)
    end
end)
