local GuideModule = require(game.ReplicatedStorage:WaitForChild("GuideModule")).ChangeDisplayedNPC
local Death = require(game.ReplicatedStorage.Effect.Container.Death)
local Respawn = require(game.ReplicatedStorage.Effect.Container.Respawn)

hookfunction(GuideModule, function() return false end)
hookfunction(Death, function() return false end)
hookfunction(Respawn, function() return false end)