local Claim_Pass = function(Claim)
    game:GetService("ReplicatedStorage").Remotes.CompRemotes.RequestTier:FireServer(Claim);
end

task.spawn(function()
    for i = 1, 10 do
        Claim_Pass(i);
    end
end)
