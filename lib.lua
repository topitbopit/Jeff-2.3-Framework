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
    shade9 = Color3.fromRGB(r*85,g*85,b*85),
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
local font = Enum.Font.Nunito
local fontbold = true
local roundamount = 10
local roundifying = true

local screen = Instance.new("ScreenGui")
screen.Parent = game.CoreGui

local custommouse = Instance.new("ImageLabel")
custommouse.Parent = screen
custommouse.Size = UDim2.new(0, 64, 0, 64)
custommouse.BackgroundTransparency = 1
custommouse.Visible = false
custommouse.Image = "rbxassetid://6947646008"
custommouse.ZIndex = 9999
custommouse.ImageColor3 = JFR.Theme.shade9

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
        f.BorderSizePixel = 0
        
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

function JFR.SetBold(bool)
   fontbold = bool 
end
function JFR.SetFont(new)
    font = new
end
function JFR.SetRoundAmount(new)
    roundamount = new 
end
function JFR.SetRoundifyEnabled(new)
    roundifying = new 
end

function JFR.SetRandomNameTo(new)
    for i,v in pairs(screen:GetDescendants()) do
        if v.Name == ":pinched_fingers:" then
            v.Name = new
        end
    end
end

local function Roundify(v)
    if roundifying then
        v.BorderSizePixel = 0
        local e = Instance.new("UICorner")
        e.Parent = v
        e.Name = IIII()
        e.CornerRadius = UDim.new(0, roundamount)
    end
end

function JFR.MakeSlider(cursor, parent, valuetable, customfunction)
    customfunction = customfunction or function() end
    
    local fsxd = (parent.Size.X.Offset)
    local fsyd = (parent.Size.Y.Offset)
    local psxd = (cursor.Size.X.Offset)
    local psyd = (cursor.Size.Y.Offset)
    parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            valuetable[1] = true
            valuetable[2] = cursor.Position
            
            JFR.TweenPosition(cursor, UDim2.new(0, input.Position.X - parent.AbsolutePosition.X, 0, input.Position.Y - parent.AbsolutePosition.Y), 0.25, nil, Enum.EasingStyle.Exponential)
            valuetable[3] = input.Position.X - parent.AbsolutePosition.X
            valuetable[4] = input.Position.Y - parent.AbsolutePosition.Y
            
            customfunction() 
            tdc = game:GetService("UserInputService").InputChanged:Connect(function(input2)
                if input2.UserInputType == Enum.UserInputType.MouseMovement then
                    local x = input2.Position.X - parent.AbsolutePosition.X
                    local y = input2.Position.Y - parent.AbsolutePosition.Y
                    
                    if x > fsxd-psxd then
                        x = fsxd-psxd
                    elseif x < 0 then
                        x = 0
                    end
                    
                    if y > fsyd-psyd then
                        y = fsyd-psyd
                    elseif y < 0 then
                        y = 0
                    end
                    
                    
                    valuetable[3] = x
                    valuetable[4] = y
                    JFR.TweenPosition(cursor, UDim2.new(0, x, 0, y), 0.25, nil, Enum.EasingStyle.Exponential)

                    customfunction()
                end
            end)
        end
    end)
    
    parent.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            valuetable[1] = false
            tdc:Disconnect()
            
        end
    end) 
end

function JFR.GetInstance(name)
    return JFR.Instances[name] or nil
end
function JFR.GetInstanceFromName(name)
    return JFR.Instances[name] or nil
end
function JFR.GetInstanceByName(name)
    return JFR.Instances[name] or nil
end


function JFR.GetInstanceValueFromName(name)
    return JFR.InstanceStates[name] or nil
end
function JFR.GetInstanceValue(name)
    return JFR.InstanceStates[name] or nil
end
function JFR.GetInstanceValueByName(name)
    return JFR.InstanceStates[name] or nil
end

function JFR.GetInstanceTable(name)
    return JFR.Instances
end
function JFR.GetInstanceValueTable(name)
    return JFR.InstanceStates
end

function JFR.GetInstanceStatesTable(name)
    return JFR.InstanceStates
end


function JFR.SetInstance(name, value)
    JFR.Instances[name] = value
    return true
end
function JFR.SetInstanceValue(name, value)
    JFR.InstanceStates[name] = value
    return true
end

function JFR.SetInstanceState(name, value)
    JFR.InstanceStates[name] = value
    return true
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
        
        local sc = Instance.new("ScreenGui")
        sc.Parent = game.CoreGui
        sc.Name = "Message"
        local MessageFrame = Instance.new("Frame")
        local MessageLabel = Instance.new("TextButton")
        
        MessageFrame.Parent = sc
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
        MessageLabel.Font = font
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
        sc:Destroy() 
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
    params.AnchorPoint = params.AnchorPoint or Vector2.new(0,0)
    params.Nodrag = params.Nodrag or false
    params.Unroundify = params.Unroundify or false
    
    mainboard = mainboard or false
    

    local connec = nil
    local inst = Instance.new("Frame")
    inst.Parent           = parent
    inst.BackgroundColor3 = params.BackgroundColor3
    inst.BorderColor3     = params.BorderColor3
    inst.BorderSizePixel  = 0
    inst.AnchorPoint      = params.AnchorPoint
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
        
        if params.Nodrag == false then
            inst.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging[1] = true
                    Dragging[2] = input.Position --current position
                    Dragging[3] = inst.Position --starting position 
                    
    
                end
            end)
            
            inst.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging[1] = false
                end
            end)
            
            tdc = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    custommouse.Position = UDim2.new(0, mouse.X - 32, 0, mouse.Y - 32)--UDim2.new(input.Position.X.Scale, input.Position.X.Offset, input.Position.Y.Scale, input.Position.Y.Offset)
                    
                    if Dragging[1] then
                        local delta = input.Position - Dragging[2]
                        JFR.TweenPosition(inst, UDim2.new(Dragging[3].X.Scale, Dragging[3].X.Offset + delta.X, Dragging[3].Y.Scale, Dragging[3].Y.Offset + delta.Y), 0.75)
                    end
                end
            end)
        end
        
        inst.AncestryChanged:Connect(function(_, parent)
            if not parent then
                tdc:Disconnect() 
                UserInputService.MouseIconEnabled = true
            end
        end)
        
        inst.MouseEnter:Connect(function()
            UserInputService.MouseIconEnabled = false
            custommouse.Visible = true
            
            tdc2 = UserInputService.InputChanged:Connect(function()
                custommouse.Position = UDim2.new(0, mouse.X - 32, 0, mouse.Y - 32) 
                
            end)
        end)
        
        inst.MouseLeave:Connect(function()
            UserInputService.MouseIconEnabled = true
            custommouse.Visible = false
            
            tdc2:Disconnect()
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
    inst.BorderSizePixel = 0 
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
    inst.Font = font
    if fontbold then
        inst.Text = "<b>"..params.Text.."</b>"
    else
        inst.Text = params.Text
    end
    inst.Size = params.Size
    inst.TextColor3 = params.TextColor3
    inst.TextSize = params.TextSize
    inst.BorderSizePixel = 0 
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
    inst.Font = font
    inst.Text = params.Text
    inst.BorderSizePixel = 0 
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



function JFR.NewTextBox(name, parent, params, functiononleave)
    
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
    inst.Font = font
    inst.Text = params.Text
    inst.BorderSizePixel = 0 
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
        functiononleave()
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
    position = position or UDim2.new(0.7, 0, 0.7, 0)

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

function JFR.SetTheme(tab)
    r = tab.r
    g = tab.g
    b = tab.b
    
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
        shade9 = Color3.fromRGB(r*85,g*85,b*85),
        text = Color3.fromRGB(255-(r*8),255-(g*8),255-(b*8)),
        selected = Color3.fromRGB(r*40,g*40+20,b*40)
    }
    
    custommouse.ImageColor3 = JFR.Theme.shade9
end

return JFR
