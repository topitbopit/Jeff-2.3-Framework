local function OpenObject(object, timing, dir)
    timing = timing or 0.25 
    dir = dir or Enum.EasingDirection.Out
    TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{BackgroundColor3 = SelectedTheme[6] }):Play()
end

local function CloseObject(object, timing, dir)
    timing = timing or 0.25 
    dir = dir or Enum.EasingDirection.Out
    TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{BackgroundColor3 = SelectedTheme[4] }):Play()
end

local function FadeOut(object, timing)
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




local function TweenPosition(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ Position = dest }):Play()
end

local function TweenCanvasPosition(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ CanvasPosition = dest }):Play()
end

local function TweenCFrame(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ CFrame = dest }):Play()
end

local function TweenSize(object, dest, timing, dir)
    timing = timing or 0.25
    dir = dir or Enum.EasingDirection.Out
    game.TweenService:Create(object,TweenInfo.new(timing, Enum.EasingStyle.Exponential, dir),{ Size = dest  }):Play()
end
