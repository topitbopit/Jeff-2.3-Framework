if _G.JTagsLoaded ~= true then
    _G.JTagsLoaded = true
    
    local database = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/jeff-tags/main/database.lua'))()
    
    
    local ps = game:GetService("Players")
    
    local function AddJTag(char, data)
    
        local Bill = Instance.new("BillboardGui")
        local Background = Instance.new("ImageLabel")
        local Text = Instance.new("TextLabel")
        local Username = Instance.new("TextLabel")
        
        Bill.Parent = char
        Bill.AlwaysOnTop = false
        Bill.Name = "JTag"..tostring(math.random(10000,50000))
        Bill.Size = UDim2.new(2, 0, 2, 0)
        Bill.StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
    
        Background.Name = "Background"
        Background.Parent = Bill
        Background.Image = "rbxassetid://3570695787"
        Background.ImageColor3 = Color3.fromRGB(0, 0, 0)
        Background.BackgroundTransparency = 1
        Background.ImageTransparency = 0.25
        Background.Size = UDim2.new(3, 0, 1, 0)
        Background.Position = UDim2.new(-1, 0, 0, 0)
        Background.ScaleType = Enum.ScaleType.Slice
        Background.SliceCenter = Rect.new(100, 100, 100, 100)
        Background.SliceScale = 1
        
    
        Text.Name = "Message"
        Text.Parent = Background
        Text.Font = Enum.Font.Nunito
        Text.Text = data[2]
        Text.TextStrokeTransparency = 0
        Text.TextTransparency = 0
        Text.BackgroundTransparency = 1
        Text.BorderSizePixel = 0
        Text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text.Size = UDim2.new(0.45, 0, 0.55, 0)
        Text.Position = UDim2.new(0.45, 0, 0.125, 0)
        Text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        Text.TextScaled = true
        Text.ZIndex = 50
        Text.RichText = true
        Text.TextYAlignment = Enum.TextYAlignment.Top
        
        Username.Name = "Username"
        Username.Parent = Background
        Username.Font = Enum.Font.Nunito
        Username.Text = data[1]
        Username.TextStrokeTransparency = 0
        Username.TextTransparency = 0
        Username.BackgroundTransparency = 1
        Username.BorderSizePixel = 0
        Username.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Username.TextColor3 = Color3.fromRGB(255, 255, 255)
        Username.Size = UDim2.new(0.45, 0, 0.2, 0)
        Username.Position = UDim2.new(0.45, 0, 0.678, 0)
        Username.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        Username.TextScaled = true
        Username.ZIndex = 50
        Username.RichText = true
        Username.TextYAlignment = Enum.TextYAlignment.Bottom
        
        if data[3] then
            local Image = Instance.new("ImageLabel")
            Image.Parent = Background
            Image.Image = "rbxassetid://"..data[3]
            Image.BackgroundTransparency = 1
            Image.BorderSizePixel = 0
            Image.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Image.Size = UDim2.new(0.25, 0, 0.75, 0)
            Image.Position = UDim2.new(0.15, 0, 0.125, 0)
            Image.ZIndex = 50
            Image.Name = "Picture"
        end
    end
    
    local function Thread(e)
        coroutine.resume(coroutine.create(e)) 
    end
    
    ps.PlayerAdded:Connect(function(player)
        Thread(function() 
            for _,data in pairs(database) do
                if player.Name == data[1] then
                    player.CharacterAdded:Connect(function(char)
                        wait(0.1)
                        AddJTag(char.Head, data)
                        
                    end)
                end
            end
            
        end)
    end)
    
    for i,plr in pairs(game.Players:GetChildren()) do 
        Thread(function() 
            for _,data in pairs(database) do
                if plr.Name == data[1] then
                    pcall(function() AddJTag(plr.Character.Head, data) end)
                    
                    plr.CharacterAdded:Connect(function(char)
                        wait(0.1)
                        AddJTag(char.Head, data)
                        
                    end)
                    break
                end
            end
        end)
    end
end
