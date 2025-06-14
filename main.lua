local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success then
    warn("Failed to load Rayfield Library. Check the URL or your internet connection.")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "FS Exploit Window",
    LoadingTitle = "Fashion Icon Exploits is loading.",
    LoadingSubtitle = "by Ihe4vii and Baddie",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DTI_Exploits",
        FileName = "Hi_EXPLOITS"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    Theme = "Bloom",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false
})

local MainTab = Window:CreateTab("Main")

MainTab:CreateButton({
    Name = "Guess The Theme...",
    Callback = function()
        local Params = {
            RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
            SSI = "saveinstance"
        }

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")

        local matchFolder = ReplicatedStorage:FindFirstChild("Match")
        if matchFolder then
            local theme = matchFolder:FindFirstChild("Theme")
            local gameState = matchFolder:FindFirstChild("GameState")

            if theme then
                theme:Destroy()
            end

            if gameState then
                gameState:Destroy()
            end
        end

        local function handleGui()
            local permanentGui = playerGui:WaitForChild("PermanentGui", 5)
            if not permanentGui then warn("PermanentGui not found") return end

            local info = permanentGui:FindFirstChild("Info")
            if not info then warn("Info not found") return end

            local labels = info:FindFirstChild("Labels")
            if not labels then warn("Labels not found") return end

            local gameMessage1 = labels:FindFirstChild("GameMessage1")
            local gameMessage2 = labels:FindFirstChild("GameMessage2")
            local helping = info:FindFirstChild("Helping")

            local message1Text = "No peaking! you've selected to hide the theme / gamestate."
            local message2Text = "uhh what time was it?"

            if gameMessage1 then
                gameMessage1.Text = message1Text
                gameMessage1:GetPropertyChangedSignal("Text"):Connect(function()
                    if gameMessage1.Text ~= message1Text then
                        gameMessage1.Text = message1Text
                        warn("Blocked a change to GameMessage1.Text")
                    end
                end)
            else
                warn("GameMessage1 not found")
            end

            if gameMessage2 then
                gameMessage2.Text = message2Text
                gameMessage2:GetPropertyChangedSignal("Text"):Connect(function()
                    if gameMessage2.Text ~= message2Text then
                        gameMessage2.Text = message2Text
                        warn("Blocked a change to GameMessage2.Text")
                    end
                end)
            else
                warn("GameMessage2 not found")
            end

            if helping then
                helping:Destroy()
            else
                warn("Helping not found to destroy")
            end
        end

        task.delay(1, handleGui)
    end
})
