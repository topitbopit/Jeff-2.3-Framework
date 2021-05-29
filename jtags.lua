if _G.JTagsLoaded ~= true then
    _G.JTagsLoaded = true
    
    local database = {
        {"jeffismyname4678","",6879141802},
        {"jeffismyname4678_1","",6879141802},
        {"jeffismyname4678_2","",6879141802},
        {"jeffismyname4678_3","",6879141802},
        {"jeffismyname4678_4","",6879141802},
        {"jeffismyname4678_5","",6879141802},
        {"hoops_morelikepoops","gaming god",6878054826},
        {"appleupmepoophole","aple bana",6879490266},
        {"gmancopa28alt","",6879490266},
        {"johncenaisa_woman","",6879490266},
        {"boiboiunotgoood","Such Wow",nil}
    }
    
    
    local PlayerService = game:GetService("Players")
    
    local function AddJTag(char, data)
    
        local Bill = Instance.new("BillboardGui")
        local Text = Instance.new("TextLabel")
    
        
        Bill.Parent = char
        Bill.AlwaysOnTop = true
        Bill.Name = "JTag"
        Bill.Size = UDim2.new(2, 0, 2, 0)
        Bill.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
    
        Text.Parent = Bill
        Text.Font = Enum.Font.Nunito
        Text.Text = data[2]
        Text.TextStrokeTransparency = 0
        Text.TextTransparency = 0
        Text.BackgroundTransparency = 1
        Text.BorderSizePixel = 0
        Text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text.Size = UDim2.new(1, 0, 1, 0)
        Text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        Text.TextScaled = true
        Text.ZIndex = 50
        Text.RichText = true
        
        if data[3] then
            local Image = Instance.new("ImageLabel")
            Image.Parent = Bill
            Image.Image = "rbxassetid://"..data[3]
            Image.BackgroundTransparency = 1
            Image.BorderSizePixel = 0
            Image.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Image.Size = UDim2.new(1, 0, 1, 0)
        end
    end
    
    local function Thread(e)
        coroutine.resume(coroutine.create(e)) 
    end
    
    PlayerService.PlayerAdded:Connect(function(player)
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
