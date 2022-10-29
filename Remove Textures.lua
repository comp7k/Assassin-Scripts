local hasProperty = function(a, b)
    local c = a[b];
end
    
task.spawn(function()
    for i, v in next, workspace:GetDescendants() do
        local Check = pcall(function()hasProperty(v, "Material")end)
        
        if Check then
            v.Material = "Plastic";
        end
    end
    
    workspace.DescendantAdded:Connect(function(v)
        local Check = pcall(function()hasProperty(v, "Material")end)
        
        if Check then
            v.Material = "Plastic";
        end
    end)
end)
