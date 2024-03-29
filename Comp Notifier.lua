local Player = game:GetService("Players").LocalPlayer;
local ScreenGui = Player.PlayerGui.ScreenGui;
local Grid = ScreenGui.UI.NormalSeason.Arena.PlayerHold.GlobalGrid;

local Notify = function(Message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Comp Notifier";
        Text = Message;
        Icon = "rbxassetid://866746510";
        Duration = 10;
    })
end

task.spawn(function()
    if not Grid:FindFirstChild("CompPlayerSlot11") then
        for i, v in next, Grid:GetChildren() do
            if v.ClassName == "Frame" and v.Name == "CompPlayerSlot" then
                v.Name = tostring(v.Name .. i - 1);
            end
        end
    end
end)

task.spawn(function()
    local Current_Points = ScreenGui.UI.NormalSeason.Arena.StatFrame.pts.ptTotal;
    local Eleventh_Points = Grid:WaitForChild("CompPlayerSlot11").pts.TextLabel;
    local Your_Lead = Current_Points.Text - Eleventh_Points.Text;
    
    if Your_Lead > 0 then
        Notify("Your Lead On 11th Is: " .. Your_Lead .. ".");
    else
        Notify("You Have No Lead On 11th.");
    end
end)
