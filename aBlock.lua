local ScriptContext = game:GetService('ScriptContext')
local HttpService = game:GetService('HttpService')  
local BrowserService = game:GetService('BrowserService')
local LocalPlayer = game:GetService('Players').LocalPlayer
local CaptureService = game:GetService("CaptureService")

local errorMsg = 'player attempted to call blocked function'
local errorNullByte = 'null byte detected'

local function bytebypass(...)
    for _, arg in ipairs({...}) do
        if type(arg) == "string" and arg:find("\0") then
            return true
        end
    end
    return false
end


local trashexecutors = {
    "Monolith",
    "Krucus 1.0.0",
    "Virtual"
}

local function trashexecutor()
    local executor = identifyexecutor()
    print(executor)
    for _, trashExecutor in ipairs(trashexecutors) do
        if executor == trashExecutor then
            if LocalPlayer then
                LocalPlayer:Kick("horrible executor: " .. executor)
            else
                print("Block Started!")
            end
            break
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player == LocalPlayer then
        trashexecutor()
    end
end)

local function createInterceptor(originalFunction, name)
    return function(...)
        if bytebypass(...) then
            error(errorNullByte)
        end

        if LocalPlayer then
            LocalPlayer:Kick(errorMsg)
        else
            error('localplayer is not available')
        end

        return originalFunction(...)
    end
end


local originalSaveScriptProfilingData = ScriptContext.SaveScriptProfilingData
local originalRequestInternal = HttpService.RequestInternal
local originalAddCoreScriptLocal = ScriptContext.AddCoreScriptLocal
local originalExecuteJavaScript = BrowserService.ExecuteJavaScript
local originalOpenBrowserWindow = BrowserService.OpenBrowserWindow
local originalOpenUrl = BrowserService.OpenUrl
local originalScriptProfilerService = ScriptContext.ScriptProfilerService
local originalDeleteCapture = CaptureService.DeleteCapture

ScriptContext.SaveScriptProfilingData = createInterceptor(originalSaveScriptProfilingData, "SaveScriptProfilingData")
HttpService.RequestInternal = createInterceptor(originalRequestInternal, "RequestInternal")
ScriptContext.AddCoreScriptLocal = createInterceptor(originalAddCoreScriptLocal, "AddCoreScriptLocal")
BrowserService.ExecuteJavaScript = createInterceptor(originalExecuteJavaScript, "ExecuteJavaScript")
BrowserService.OpenBrowserWindow = createInterceptor(originalOpenBrowserWindow, "OpenBrowserWindow")
BrowserService.OpenUrl = createInterceptor(originalOpenUrl, "OpenUrl")
ScriptContext.ScriptProfilerService = createInterceptor(originalScriptProfilerService, "ScriptProfilerService")
CaptureService.DeleteCapture = createInterceptor(originalDeleteCapture, "DeleteCapture")
