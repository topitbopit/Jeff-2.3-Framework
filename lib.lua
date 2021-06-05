local r = math.random(1,3)
local g = math.random(1,3)
local b = math.random(1,3)



local JFR = {}

JFR.Instances = {}
JFR.InstanceStates = {}
JFR.ParentBoard = nil
JFR.Theme = {
    shadow = Color3.fromRGB(0,0,0),
    shade1 = Color3.fromRGB(r*2,g*2,b*2),
    shade2 = Color3.fromRGB(r*5,g*5,b*5),
    shade3 = Color3.fromRGB(r*13,g*13,b*13),
    shade4 = Color3.fromRGB(r*14,g*14,b*14),
    shade5 = Color3.fromRGB(r*17,g*17,b*17),
    shade6 = Color3.fromRGB(r*21,g*21,b*21),
    shade7 = Color3.fromRGB(r*25,g*25,b*25),
    shade8 = Color3.fromRGB(r*51,g*51,b*51),
    text = Color3.fromRGB(255-(r*8),255-(g*8),255-(b*8)),
    selected = Color3.fromRGB(r*40,g*40+20,b*40)
}




local PlayerService        = game:GetService("Players")
local TeamsService         = game:GetService("Teams")
local TweenService         = game:GetService("TweenService")
local RunService           = game:GetService("RunService")
local MarketService        = game:GetService("MarketplaceService")
local UserInputService     = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local screen = Instance.new("ScreenGui")
screen.Parent = game.CoreGui

function JFR.OpenObject(object, timing, dir)
    timing = timing or 0.25 
    dir = dir or Enum.EasingDirection.Out
    TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{BackgroundColor3 = JFR.Theme.selected }):Play()
end

function JFR.CloseObject(object, timing, dir)
    timing = timing or 0.25 
    dir = dir or Enum.EasingDirection.Out
    TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{BackgroundColor3 = JFR.Theme.shade7}):Play()
end

function JFR.TweenPosition(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ Position = dest }):Play()
end

function JFR.TweenCanvasPosition(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ CanvasPosition = dest }):Play()
end

function JFR.TweenCFrame(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ CFrame = dest }):Play()
end

function JFR.TweenSize(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ Size = dest  }):Play()
end

function JFR.TweenCustom(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),dest):Play()
end

function JFR.ClickAnimation(object)
    coroutine.resume(coroutine.create(function()
        
        local f = Instance.new("ImageLabel")
        
        f.Parent = object
        f.BackgroundTransparency = 1
        f.ZIndex = object.ZIndex + 1
        f.Image = "rbxassetid://3570695787"
        f.ImageColor3 = JFR.Theme.text
        f.ImageTransparency = 0.3
        
        f.Size = UDim2.new(0, 0, 0, 0)
    	f.Position = UDim2.new(0.5, mouse.X - (object.AbsolutePosition.X + (object.Size.X.Offset / 2)), 0.5, 0)
    
        JFR.TweenCustom(f, {ImageTransparency = 1, Size = UDim2.new(0, object.Size.X.Offset, 0, object.Size.X.Offset), Position = UDim2.new(0.5, (mouse.X - (object.AbsolutePosition.X + (object.Size.X.Offset / 2))) - (object.Size.X.Offset / 2), 0.5, -(object.Size.X.Offset / 2))}, 0.7)
        wait(0.7)
        f:Destroy()
    
    end))
end

function JFR.ParticleAnimation(object)
    coroutine.resume(coroutine.create(function()
        local part = {}
        for i = 0, 10 do 
            local f = Instance.new("ImageLabel")
            
            
            f.Parent = object
            f.BackgroundTransparency = 1
            f.ZIndex = object.ZIndex + 1
            f.Image = "rbxassetid://3570695787"
            f.ImageColor3 = JFR.Theme.text
            f.ImageTransparency = 0.5
            
            f.Size = UDim2.new(0, 8, 0, 8)
        	f.Position = UDim2.new(0.5, object.TextBounds.X / 2 - 4, 0.5, -4)
        	table.insert(part, f)
            
            JFR.TweenCustom(f, {ImageTransparency = 1, Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, f.Position.X.Offset + math.random(-25, 25), 0.5, math.random(-25, 25))}, 2)
        end
        wait(2)
        for i,v in pairs(part) do
            part[i] = nil
            v:Destroy()
        end
    end))
end

function JFR.FadeOut(object, timing)
    timing = timing or 0.75 
    for i,v in pairs(object:GetDescendants()) do
        if v:IsA("Frame") then
            TweenService:Create(v,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
        elseif v:IsA("ScrollingFrame") then
            TweenService:Create(v,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{BackgroundTransparency = 1, ScrollBarImageTransparency = 1}):Play()
            v.ScrollBarThickness = 0
        elseif v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
            TweenService:Create(v,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{BackgroundTransparency = 1, TextTransparency = 1}):Play()
        elseif v:IsA("ImageLabel") then
            TweenService:Create(v,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{BackgroundTransparency = 1, ImageTransparency = 1}):Play()
        end
    end
    if object:IsA("Frame") then
        TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
    elseif object:IsA("TextLabel") then
        TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
    end
end

function JFR.Async(func)
    coroutine.resume(coroutine.create(func)) 
    
end

local function IIII()
    local out = ":pinched_fingers:"

    return out
end




local function Roundify(v)
    v.BorderSizePixel = 0
    local e = Instance.new("UICorner")
    e.Parent = v
    e.Name = IIII()
    e.CornerRadius = UDim.new(0, 10)
end





function JFR.GetInstanceByName(name)
    for i,v in pairs(JFR.Instances) do
        if i == name then
            return v
        end
    end
end

function JFR.SendMessage(params, clickevent)
    JFR.Async(function()
        params.Text     = params.Text or nil
        params.Delay    = params.Delay or 2
        params.Size     = params.Size or UDim2.new(0, 150, 0, 50)
        params.Position = params.Position or UDim2.new(0.9, 0, 0.89, 0)
        params.Horizontal = params.Horizontal or false
        params.RichText = params.RichText or true
        params.TextScaled = params.TextScaled or false
        
        clickevent      = clickevent or (function() end)
        
        
        local MessageFrame = Instance.new("Frame")
        local MessageLabel = Instance.new("TextButton")
        
        MessageFrame.Parent = screen
        MessageFrame.BackgroundColor3 = JFR.Theme.shade5
        MessageFrame.Size = params.Size
        MessageFrame.ZIndex = 200
        --MessageFrame.CanvasSize = UDim2.new(0, 0)
        MessageFrame.BackgroundTransparency = 0
        
        local v2 = MessageFrame:Clone()
        v2.Parent = MessageFrame
        v2.BackgroundColor3 = JFR.Theme.shadow
        v2.Position = MessageFrame.Position + UDim2.new(0, 3, 0, 3)
        v2.BackgroundTransparency = 0.3
        v2.ZIndex = MessageFrame.ZIndex - 1
        
        MessageLabel.Parent = MessageFrame
        MessageLabel.BackgroundTransparency = 1
        MessageLabel.BorderSizePixel = 0
        MessageLabel.TextColor3 = JFR.Theme.text
        MessageLabel.Position = UDim2.new(0.5, -(params.Size.X.Offset / 2), 0, 5)
        MessageLabel.Size = UDim2.new(0, params.Size.X.Offset, 0, 25)
        MessageLabel.Font = Enum.Font.Nunito
        MessageLabel.Text = params.Text
        MessageLabel.RichText = params.RichText
        MessageLabel.TextScaled = params.TextScaled
        MessageLabel.ZIndex = 300
        MessageLabel.AutoButtonColor = false
        MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
        
        --MessageFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        
        
        MessageLabel.MouseButton1Click:Connect(clickevent)
        
        Roundify(MessageFrame)
        Roundify(v2)
            
        if not params.Horizontal then
            MessageFrame.Position = UDim2.new(params.Position.X.Scale, params.Position.X.Offset, 1.3, params.Position.Y.Offset)
            JFR.TweenPosition(MessageFrame, UDim2.new(params.Position.X.Scale, params.Position.X.Offset, params.Position.Y.Scale, params.Position.Y.Offset), 0.75)
            wait(params.Delay)
            JFR.TweenPosition(MessageFrame, UDim2.new(params.Position.X.Scale, params.Position.X.Offset, 1.3, params.Position.Y.Offset), 1, Enum.EasingDirection.In)
        else
            MessageFrame.Position = UDim2.new(0, -params.Size.X.Offset, params.Position.Y.Scale, params.Position.Y.Offset)
            JFR.TweenPosition(MessageFrame, UDim2.new(params.Position.X.Scale, params.Position.X.Offset, params.Position.Y.Scale, params.Position.Y.Offset), 0.75)
            wait(params.Delay)
            JFR.TweenPosition(MessageFrame, UDim2.new(0, -params.Size.X.Offset, params.Position.Y.Scale, params.Position.Y.Offset), 1, Enum.EasingDirection.In)
        end
        
        wait(1)
        MessageFrame:Destroy() 
    end)
end


function JFR.NewBoard(name, parent, params, mainboard)
    params.Position = params.Position or UDim2.new(0.65, 0, 1.1, 0)
    params.Size = params.Size or UDim2.new(0, 500, 0, 250)
    params.ZIndex = params.ZIndex or 100
    params.ZIndex = params.ZIndex or 100
    params.BackgroundColor3 = params.BackgroundColor3 or JFR.Theme.shade5
    params.BorderColor3 = params.BorderColor3 or JFR.Theme.shade1
    params.BackgroundTransparency = params.BackgroundTransparency or 0
    params.Invisible = params.Invisible or false
    
    params.Unroundify = params.Unroundify or false
    
    mainboard = mainboard or false
    

    local connec = nil
    local inst = Instance.new("Frame")
    inst.Parent           = parent
    inst.BackgroundColor3 = params.BackgroundColor3
    inst.BorderColor3     = params.BorderColor3
    inst.BorderSizePixel  = 0
    inst.AnchorPoint      = Vector2.new(0,1)
    inst.Name             = (mainboard and name) or IIII()
    inst.Position         = params.Position
    inst.BackgroundTransparency = params.BackgroundTransparency
    inst.Size             = params.Size
    inst.Active           = true
    inst.Visible          = not params.Invisible
    inst.ZIndex           = params.ZIndex

    JFR.Instances[name] = inst
    
    if not params.Unroundify then
       Roundify(inst) 
    end

    if mainboard then
        JFR.ParentBoard = inst
        local Dragging = {}
        
        inst.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging[1] = true
                Dragging[2] = input.Position
                Dragging[3] = inst.Position
            end
        end)
        
        inst.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging[1] = false
            end
        end)
        
        connec = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if Dragging[1] then
                    local delta = input.Position - Dragging[2]
                    JFR.TweenPosition(inst, UDim2.new(Dragging[3].X.Scale, Dragging[3].X.Offset + delta.X, Dragging[3].Y.Scale, Dragging[3].Y.Offset + delta.Y), 0.75)
                end
            end
        end)
        
        inst.AncestryChanged:Connect(function(_, parent)
            if not parent then
                connec:Disconnect() 
            end
        end)
        
        inst.MouseEnter:Connect(function()
            mouse.Icon = "rbxassetid://6912096183"
            
        end)
        
        inst.MouseLeave:Connect(function()
            mouse.Icon = ""
        end)
    end
    

    return inst

end


function JFR.NewMenu(name, parent, params)
    params.Position = params.Position or UDim2.new(0, 0, 100, 0)
    params.CanvasSize = params.CanvasSize or UDim2.new(0, 350, 0, 400)
    params.Size = params.Size or UDim2.new(0, 400, 0, 200)
    params.ZIndex = params.ZIndex or parent.ZIndex + 20
    params.BackgroundColor3 = params.BackgroundColor3 or JFR.Theme.shade3
    params.BorderColor3 = params.BorderColor3 or JFR.Theme.shade1
    params.Invisible = params.Invisible or false
    
    params.Unroundify = params.Unroundify or false
    

    local inst = Instance.new("ScrollingFrame")
    inst.Parent = parent
    inst.BackgroundColor3 = params.BackgroundColor3
    inst.BorderColor3 = params.BorderColor3
    inst.AnchorPoint = Vector2.new(0,1)
    inst.Position = params.Position
    inst.Size = params.Size
    inst.CanvasSize = params.CanvasSize
    inst.ScrollingDirection = Enum.ScrollingDirection.Y
    inst.ScrollBarThickness = 5
    inst.ScrollBarImageColor3 = JFR.Theme.shade8
    inst.ScrollBarImageTransparency = 0
    inst.Active = true
    inst.Visible = not params.Invisible
    inst.Name = IIII()
    inst.ZIndex = params.ZIndex

    JFR.Instances[name] = inst
    
    if not params.Unroundify then
       Roundify(inst) 
    end
    
    return inst
end

function JFR.NewText(name, parent, params)
    params.Position = params.Position or UDim2.new(0, 0, 0, 0)
    params.Size = params.Size or UDim2.new(0, 270, 0, 35)
    params.ZIndex = params.ZIndex or parent.ZIndex + 20
    params.Text = params.Text or "add text"
    params.TextSize = params.TextSize or 19
    params.RichText = params.RichText or true
    params.TextYAlignment = params.TextYAlignment or Enum.TextYAlignment.Top
    params.Invisible = params.Invisible or false
    
    params.BackgroundColor3 = params.BackgroundColor3 or JFR.Theme.shade6
    params.BorderColor3 = params.BorderColor3 or JFR.Theme.shade1
    params.TextColor3 = params.TextColor3 or JFR.Theme.text
    
    params.Unroundify = params.Unroundify or false

    local inst = Instance.new("TextLabel")
    inst.Parent = parent
    inst.Position = params.Position
    inst.Font = Enum.Font.Nunito
    inst.Text = "<b>"..params.Text.."</b>"
    inst.Size = params.Size
    inst.TextColor3 = params.TextColor3
    inst.TextSize = params.TextSize
    inst.TextXAlignment = Enum.TextXAlignment.Left
    inst.TextYAlignment = params.TextYAlignment
    inst.Name = IIII()
    inst.ZIndex = params.ZIndex
    inst.Visible = not params.Invisible
    inst.RichText = params.RichText
    inst.BackgroundTransparency = 1

    JFR.Instances[name] = inst
    
    if not params.Unroundify then
       Roundify(inst) 
    end
    
    return inst
end

function JFR.NewButton(name, parent, params, functions)
    functions = functions or {off = nil, on = function() end}
    
    local SingleFiremode = false
    if functions.off == nil then
        SingleFiremode = true
    end
    
    params.Position = params.Position or UDim2.new(0, 0, 0, 0)
    params.Size = params.Size or UDim2.new(0, 100, 0, 25)
    params.ZIndex = params.ZIndex or parent.ZIndex + 20
    params.Text = params.Text or "add text"
    params.TextSize = params.TextSize or 19
    params.RichText = params.RichText or true
    params.BackgroundColor3 = params.BackgroundColor3 or JFR.Theme.shade7
    params.BorderColor3 = params.BorderColor3 or JFR.Theme.shade1
    params.TextColor3 = params.TextColor3 or JFR.Theme.text
    params.Invisible = params.Invisible or false
    
    params.Unroundify = params.Unroundify or false

    local inst = Instance.new("TextButton")
    inst.Parent = parent
    inst.Position = params.Position
    inst.Font = Enum.Font.Nunito
    inst.Text = params.Text
    inst.Size = params.Size
    inst.BackgroundColor3 = params.BackgroundColor3
    inst.TextColor3 = params.TextColor3
    inst.TextSize = params.TextSize
    inst.RichText = params.RichText
    inst.Name = IIII()
    inst.Visible = not params.Invisible
    inst.ZIndex = params.ZIndex
    inst.BackgroundTransparency = 0
    inst.ClipsDescendants = true


    JFR.InstanceStates[name] = false
    JFR.Instances[name] = inst
    if not params.Unroundify then
       Roundify(inst) 
    end
    
    inst.MouseButton1Click:Connect(function() 
        JFR.Async(function() JFR.ClickAnimation(inst) end)
        if not SingleFiremode then
            JFR.InstanceStates[name] = not JFR.InstanceStates[name]
            if JFR.InstanceStates[name] then
                JFR.OpenObject(inst)
                functions.on()
            else
                JFR.CloseObject(inst)
                functions.off()
            end
        else
            JFR.Async(function() JFR.ClickAnimation(inst) end)
            functions.on()
        end
    end)
        
    return inst
end



function JFR.NewTextBox(name, parent, params, regex)
    
    params.Position = params.Position or UDim2.new(0, 0, 0, 0)
    params.Size = params.Size or UDim2.new(0, 100, 0, 25)
    params.ZIndex = params.ZIndex or parent.ZIndex + 20
    params.Text = params.Text or "add text"
    params.PlaceholderText = params.PlaceholderText or ""
    params.TextSize = params.TextSize or 19
    params.RichText = params.RichText or true
    params.BackgroundColor3 = params.BackgroundColor3 or JFR.Theme.shade7
    params.BorderColor3 = params.BorderColor3 or JFR.Theme.shade1
    params.TextColor3 = params.TextColor3 or JFR.Theme.text
    params.ClearTextOnFocus = params.ClearTextOnFocus or false
    params.Invisible = params.Invisible or false
    
    params.Unroundify = params.Unroundify or false

    local inst = Instance.new("TextBox")
    inst.Parent = parent
    inst.Position = params.Position
    inst.Font = Enum.Font.Nunito
    inst.Text = params.Text
    inst.Size = params.Size
    inst.BackgroundColor3 = params.BackgroundColor3
    inst.TextColor3 = params.TextColor3
    inst.TextSize = params.TextSize
    inst.PlaceholderText = params.PlaceholderText
    inst.RichText = params.RichText
    inst.Name = IIII()
    inst.ZIndex = params.ZIndex
    inst.BackgroundTransparency = 0
    inst.ClipsDescendants = true
    inst.Visible = not params.Invisible
    inst.ClearTextOnFocus = params.ClearTextOnFocus


    JFR.Instances[name] = inst
    if not params.Unroundify then
       Roundify(inst) 
    end
    
    
    inst.Focused:Connect(function() 
        JFR.Async(function() JFR.ClickAnimation(inst) end)
        JFR.OpenObject(inst)
        
    end)
    
    inst.FocusLost:Connect(function() 
        JFR.CloseObject(inst)
    end)
    
    inst:GetPropertyChangedSignal("Text"):Connect(function()
        JFR.Async(function() JFR.ParticleAnimation(inst) end)
    end)
        
    return inst
end

function JFR.GetScreen()
   return screen 
end

function JFR.GetParentBoard()
   return JFR.ParentBoard 
end

function JFR.Ready(position)
    position = position or UDim2.new(0.7, 0, 0.9, 0)

    JFR.TweenPosition(JFR.ParentBoard, position, 0.75)
    
    for i,v in pairs(screen:GetDescendants()) do
        if v:IsA("TextLabel") then
            local v2 = v:Clone()
            v2.Parent = v.Parent
            v2.TextColor3 = JFR.Theme.shadow
            v2.Position = v.Position + UDim2.new(0, 3, 0, 3)
            v2.TextTransparency = 0.3
            v2.ZIndex = v.ZIndex - 1
        end
    end
end

return JFR
