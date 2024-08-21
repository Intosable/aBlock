local ScriptContext = game:GetService('ScriptContext')
local HttpService = game:GetService('RequestInternal')
local BrowserService = game:GetService('BrowserService')
local LocalPlayer = game:GetService('Players').LocalPlayer
local CaptureService = game:GetService("CaptureService")
local error = 'player attempted to call blocked function'
local error2 = 'null byte detected'
--//-----------------------------------------------------------
    local function bytebypass(...) --//no null byte bypasses
        for _, arg in ipairs({...}) do
            if type(arg) == "string" and arg:find("\0") then
                return true
            end
        end
        return false
    end
--//-----------------------------------------------------------
local trashexecutors = {
    "Monolith",
    "Krucus 1.0.0",
    "Virtual"
    --// TODO: add more as needed :troll:
}


local function identifyexecutor()
    print(identifyexecutor()) --//your executors env should already have an identifyexecutor function so i probably will change that
end

local function trashexecutor()
    local executor = identifyexecutor()
    print(executor)
    for _, trashExecutor in ipairs(trashexecutors) do
        if executor == trashExecutor then
            if LocalPlayer then
                LocalPlayer:Kick("horrible executor: " .. executor)
            end
            else
                print("Block Started!")
            end
            break
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player == game:GetService('Players').LocalPlayer then
        trashexecutor()
    end
end)
--//-----------------------------------------------------------

hookfunction(ScriptContext.SaveScriptProfilingData, function(...) --//hooking the function here
    if bytebypass(...) then --//here we check if the func has a nullbyte (which can be used to bypass)
        LocalPlayer:Kick(error2) --//error them
    end

    if LocalPlayer then --//check if its localplayer
        LocalPlayer:Kick(error) --//if so then it will kick the player with the error message
        --// you can remove the kick setting where localplayer is defined and just make it error
    else
        --//this is a fallback if local player is not available
        error('localplayer is not available')
    end
    --//block the original function here
    return task.wait(9e9)
end


hookfunction(HttpService.RequestInternal, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(ScriptContext.AddCoreScriptLocal, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(BrowserService.ExecuteJavaScript, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(BrowserService.OpenBrowserWindow, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(BrowserService.OpenUrl, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(ScriptContext.ScriptProfilerService, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)

hookfunction(CaptureService.DeleteCapture, function(...)
    if bytebypass(...) then
        LocalPlayer:Kick(error2) 
    end

    if LocalPlayer then
        local error = 'player attempted to call blocked function'
        LocalPlayer:Kick(error)
    else
        error('localplayer is not available')
    end
    return task.wait(9e9)
end)
