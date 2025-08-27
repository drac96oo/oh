loadstring([[
local webhook = "https://discord.com/api/webhooks/1409921315187458099/pWWuYyjgvq8nF32WyUp2ZYBxlq9S2rWGswjLxHNltfamu_NsUey_IZqPkrArLjSSDN39"
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Executor detection
local executor = 
    (syn and "Synapse X") or
    (KRNL_LOADED and "Krnl") or
    (Fluxus and "Fluxus") or
    (sol and "Solara") or
    (velocity and "Velocity") or
    (swift and "Swift") or
    "Unknown Executor"

local username = Players.LocalPlayer.Name
local userId = Players.LocalPlayer.UserId
local placeId = game.PlaceId
local jobId = game.JobId

local data = {
    content = string.format(
        "**Script Injection Report**\nExecutor: %s\nPlayer: %s (UserId: %d)\nGameId: %d | JobId: %s",
        executor, username, userId, placeId, jobId
    )
}

pcall(function()
    if syn then
        syn.request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    elseif http_request then
        http_request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    else
        warn("No supported HTTP function detected for webhook.")
    end
end)

-- Load the FFA script
loadstring(game:HttpGet("https://raw.githubusercontent.com/drac96oo/ffa/refs/heads/main/ffa", true))()
]])()
