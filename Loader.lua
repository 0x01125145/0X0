
-- Full Loader.lua (Option 2)
-- Loads LoaderScreen, Library, Game Profiles, UI, and fades out cleanly

local function fetch(url)
    return loadstring(game:HttpGet(url))()
end

local CreateLoaderScreen = fetch("https://raw.githubusercontent.com/0x01125145/0X0/refs/heads/main/LoaderScreen")
local Library = fetch("https://raw.githubusercontent.com/0x01125145/0X0/refs/heads/main/library")

local loaderGui, FadeOut = CreateLoaderScreen("Loading...")

task.wait(1.5)

local Window = Library:CreateWindow({
    Title = "0X0 Hub",
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab("Main"),
    Game = Window:AddTab("Game"),
    Settings = Window:AddTab("Settings"),
}

Tabs.Main:AddParagraph({
    Title = "Welcome",
    Content = "Thanks for using 0X0 Hub."
})

Tabs.Settings:AddSlider("UI Transparency", {
    Text = "UI Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        Library:SetTransparency(value)
    end
})

Tabs.Settings:AddKeybind("Toggle UI", {
    Text = "Toggle UI",
    Default = Enum.KeyCode.RightShift,
    Callback = function()
        Library:ToggleUI()
    end
})

local GameProfiles = {
    [2753915549] = "Blox Fruits",
    [4442272183] = "Blox Fruits",
    [7449423635] = "Blox Fruits",
    [189707] = "Natural Disaster Survival",
}

local currentGame = GameProfiles[game.PlaceId]

if currentGame == "Blox Fruits" then
    Tabs.Game:AddParagraph({
        Title = "Blox Fruits",
        Content = "Detected Blox Fruits. Loading tools..."
    })

    Tabs.Game:AddButton({
        Text = "Auto Farm",
        Callback = function()
            print("Auto Farm Loaded")
        end
    })

elseif currentGame == "Natural Disaster Survival" then
    Tabs.Game:AddParagraph({
        Title = "NDS",
        Content = "Detected Natural Disaster Survival."
    })

    Tabs.Game:AddButton({
        Text = "Auto Win",
        Callback = function()
            print("Auto Win Loaded")
        end
    })

else
    Tabs.Game:AddParagraph({
        Title = "Unknown Game",
        Content = "No profile found for this game."
    })
end

task.wait(0.5)
FadeOut()
