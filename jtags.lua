if _G.JTagsLoaded ~= true then
    _G.JTagsLoaded = true
    
    local database = {
        {"jeffismyname4678","topit#2083",6879141802},
        {"jeffismyname4678_1","epic gaming",6879141802},
        {"jeffismyname4678_2","e",6879141802},
        {"jeffismyname4678_3","sussy",6879141802},
        {"jeffismyname4678_4",":pinched_fingers:",6879141802},
        {"jeffismyname4678_5","yeah i play among us",6879141802},
        {"hoops_morelikepoops","<font size='15'><font color='rgb(255,0,0)'>g</font><font color='rgb(255,128,0)'>a</font><font color='rgb(255,255,0)'>m</font><font color='rgb(128,255,0)'>i</font><font color='rgb(0,255,0)'>n</font><font color='rgb(0,255,128)'>g </font><font color='rgb(0,255,255)'>g</font><font color='rgb(0,128,255)'>o</font><font color='rgb(0,0,255)'>d</font></font><br/><font size='5'><i><font color='#262377'>d</font><font color='#2F2275'>i</font><font color='#372173'>s</font><font color='#3F2071'>c</font><font color='#481F6F'>o</font><font color='#501E6D'>r</font><font color='#581E6B'>d</font><font color='#611D69'>.</font><font color='#691C67'>g</font><font color='#711B65'>g</font><font color='#791A63'>/</font><font color='#821961'>a</font><font color='#8A185F'>3</font><font color='#92185D'>J</font><font color='#9B175B'>E</font><font color='#A31659'>r</font><font color='#AB1557'>9</font><font color='#B41455'>Z</font><font color='#BC1353'>6</font><font color='#C41251'>j</font><font color='#CD124F'>Y</font></i></font>",6878054826},
        {"appleupmepoophole","aple bana",6879490266},
        {"gmancopa28alt","LOOL!OL!OL!OLLO!OLOL",6879490266},
        {"johncenaisa_woman","woman",6879490266},
        {"boiboiunotgoood","Such wow",6879702855},
        {"RSG_Quackity","Fuck Off",2560019913}
    }
    
    
    local PlayerService = game:GetService("Players")
    
    local function AddJTag(char, data)
    
        local Bill = Instance.new("BillboardGui")
        local Background = Instance.new("ImageLabel")
        local Text = Instance.new("TextLabel")
        local Username = Instance.new("TextLabel")
        
        Bill.Parent = char
        Bill.AlwaysOnTop = false
        Bill.Name = "JTag"..tostring(math.random(10000,50000))
        Bill.Size = UDim2.new(2, 0, 2, 0)
        Bill.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
    
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
