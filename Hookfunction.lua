local ReplicatedStorage = game:GetService("ReplicatedStorage")
local task = task or require(ReplicatedStorage:WaitForChild("task"))
task.spawn(function()
    hookfunction(require(ReplicatedStorage:WaitForChild("GuideModule")).ChangeDisplayedNPC, function()
        return false
    end)
    local Container = ReplicatedStorage:WaitForChild("Effect"):WaitForChild("Container")
    hookfunction(require(Container:WaitForChild("Death")), function()
        return nil
    end)
    hookfunction(require(Container:WaitForChild("Respawn")), function()
        return nil
    end)
    require(ReplicatedStorage:WaitForChild("Util"):WaitForChild("CameraShaker")):Stop()
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then 
                v.Enabled = false 
            end
        end)
    end
end)
