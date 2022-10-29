local Player = game:GetService("Players").LocalPlayer;
local Ghost_Coins = workspace.GhostCoins;
local Candies = workspace.EventCurrency;
local Round_Status = Player.PlayerGui.ScreenGui.UI.textD;
local RunService = game:GetService("RunService");

task.spawn(function()
    RunService.Stepped:Connect(function()
        for i,v in next, Ghost_Coins:GetDescendants() do
            if v.ClassName == "TouchTransmitter" then
                firetouchinterest(Player.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0);
            end
        end
        
        for i, v in next, Candies:GetDescendants() do
            if v.ClassName == "TouchTransmitter" then
                firetouchinterest(Player.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0);
            end
        end
    end)
end)

task.spawn(function()
    Player.CharacterAdded:connect(function()
        if (Round_Status.Text == "Round In Progress" or Round_Status.Text == "Spectating" or Round_Status.Text == "") then
            game:GetService("ReplicatedStorage").Remotes.RequestGhostSpawn:InvokeServer();
        end
    end)
end)
