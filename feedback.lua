local JFR = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/Jeff-2.3-Framework/main/lib.lua', true))()




--init y values
local y = 35;
local y2 = 10;

local screen = JFR.GetScreen()

--Add main background frame
local bg = JFR.NewBoard("Jeff UI Feedback", screen, {Position = UDim2.new(0.7, 0, 1.3, 0)}, true)
screen.Name = bg.Name
local parentb = JFR.GetParentBoard()
--Gui stuff
JFR.NewText("Title", bg, {Position = UDim2.new(0, 15, 0, 15), Size = UDim2.new(0, 400, 0, 25), Text = "Jeff UI feedback", TextSize = 35, TextYAlignment = Enum.TextYAlignment.Center})
JFR.NewBoard("Shadow", bg, {ZIndex = 0, Position = UDim2.new(0, 3, 1, 13), Size = UDim2.new(0, 500, 0, 260), BackgroundTransparency = 0.3, BackgroundColor3 = JFR.Theme.shadow})
--Looks
JFR.NewBoard("Bottom1", bg, {Position = UDim2.new(0, 0, 1, 10), Size = UDim2.new(0, 125, 0, 25), BackgroundColor3 = JFR.Theme.shade4})
JFR.NewBoard("Bottom2", bg, {Position = UDim2.new(0, 100, 1, 10), Size = UDim2.new(0, 25, 0, 25), BackgroundColor3 = JFR.Theme.shade3, Unroundify = true})
JFR.NewBoard("Bottom3", bg, {Position = UDim2.new(0, 115, 1, 10), Size = UDim2.new(0, 385, 0, 25), BackgroundColor3 = JFR.Theme.shade3})
JFR.NewBoard("Outline1", bg, {Position = UDim2.new(0, 100, 0, 260), Size = UDim2.new(0, 2, 0, 210), BackgroundColor3 = JFR.Theme.shade6, ZIndex = 200})
JFR.NewBoard("Outline2", bg, {Position = UDim2.new(0, 0, 0, 50), Size = UDim2.new(0, 500, 0, 2), BackgroundColor3 = JFR.Theme.shade6, ZIndex = 200})
--Add menus
local menu1 = JFR.NewMenu("FeaturesMenu", bg, {Position = UDim2.new(0, 100, 0, 250), CanvasSize = UDim2.new(0, 100, 0, 590)})
local menu2 = JFR.NewMenu("QuestionsMenu", bg, {Position = UDim2.new(0, 100, 0, 250), CanvasSize = UDim2.new(0, 100, 0, 490), Invisible = true})
local menu3 = JFR.NewMenu("CreditMenu", bg, {Position = UDim2.new(0, 100, 0, 250), CanvasSize = UDim2.new(0, 100, 0, 100), Invisible = true})

--Add tab menu and buttons
local smenu = JFR.NewMenu("SectionMenu", bg, {Position = UDim2.new(0, 0, 0, 250), Size = UDim2.new(0, 100, 0, 200), CanvasSize = UDim2.new(0, 80, 0, 100), BackgroundColor3 = JFR.Theme.shade4})
local main = JFR.NewButton("Main", smenu, {Position = UDim2.new(0, 12, 0, y2), Size = UDim2.new(0, 75, 0, 25), Text = "Features"}, {on = function() JFR.OpenObject(JFR.GetInstanceByName("Main")); JFR.CloseObject(JFR.GetInstanceByName("Questions")); JFR.CloseObject(JFR.GetInstanceByName("Credit")); menu1.Visible = true; menu2.Visible = false; menu3.Visible = false   end})
JFR.OpenObject(main)
y2 = y2 + 40
local questions = JFR.NewButton("Questions", smenu, {Position = UDim2.new(0, 12, 0, y2), Size = UDim2.new(0, 75, 0, 25), Text = "Q/A"}, {on = function() JFR.OpenObject(JFR.GetInstanceByName("Questions")); JFR.CloseObject(main); JFR.CloseObject(JFR.GetInstanceByName("Credit")); menu1.Visible = false; menu2.Visible = true; menu3.Visible = false  end})
y2 = y2 + 40
local credit = JFR.NewButton("Credit", smenu, {Position = UDim2.new(0, 12, 0, y2), Size = UDim2.new(0, 75, 0, 25), Text = "Info"}, {on = function() JFR.OpenObject(JFR.GetInstanceByName("Credit")); JFR.CloseObject(questions); JFR.CloseObject(main); menu1.Visible = false; menu2.Visible = false; menu3.Visible = true  end})



JFR.NewText("FeaturesTitle", menu1, {Position = UDim2.new(0.05, -10, 0, y - 30), Size = UDim2.new(0, 400, 0, 25), Text = "Features", TextSize = 20})
JFR.NewText("FeaturesText1", menu1, {Position = UDim2.new(0, 10, 0, 30), BackgroundTransparency = 1, Size = UDim2.new(0, 400, 0, 75), Text = "Welcome to the Jeff UI demo! Here, you can try<br/>out various features that are going to be included<br/>in the newest jeff guis.", TextSize = 22})

JFR.NewBoard("Dash", menu1, {Position = UDim2.new(0, 10, 0, 120), Size = UDim2.new(0, 380, 0, 2), BackgroundColor3 = JFR.Theme.shade7, ZIndex = 200})

JFR.NewText("FeaturesText2", menu1, {Position = UDim2.new(0, 10, 0, 140), Size = UDim2.new(0, 400, 0, 25), Text = "Here is an example button. When you click it,<br/>a notification will pop up.", TextSize = 20})
JFR.NewButton("ButtonExample1", menu1, {Position = UDim2.new(0, 10, 0, 200), Size = UDim2.new(0, 380, 0, 25), BackgroundColor3 = JFR.Theme.shade7, Text = "Send notification"}, {on = function() JFR.SendMessage({Horizontal = true, Text = "<font size='30'>Notification!</font>", Size = UDim2.new(0, 200, 0, 50), Position = UDim2.new(0.05, 0, 0.9, 0), Delay = 2}) end})
JFR.NewText("FeaturesText3", menu1, {Position = UDim2.new(0, 10, 0, 240), Size = UDim2.new(0, 400, 0, 25), Text = "Buttons can also be toggled.", TextSize = 20})
JFR.NewButton("ButtonExample2", menu1, {Position = UDim2.new(0, 10, 0, 280), Size = UDim2.new(0, 380, 0, 25), BackgroundColor3 = JFR.Theme.shade7, Text = "Toggle notification"}, {on = function() JFR.SendMessage({Horizontal = true, Text = "<font size='30'>On..</font>", Size = UDim2.new(0, 200, 0, 50), Position = UDim2.new(0.05, 0, math.random(70,90)/100, 0), Delay = 1}) end, off = function() JFR.SendMessage({Horizontal = true, Text = "<font size='30'>Off</font>", Size = UDim2.new(0, 200, 0, 50), Position = UDim2.new(0.05, 0, math.random(70,90)/100, 0), Delay = 1}) end})

JFR.NewBoard("Dash2", menu1, {Position = UDim2.new(0, 10, 0, 330), Size = UDim2.new(0, 380, 0, 2), BackgroundColor3 = JFR.Theme.shade7, ZIndex = 200})


JFR.NewText("FeaturesText4", menu1, {Position = UDim2.new(0, 10, 0, 350), Size = UDim2.new(0, 400, 0, 25), Text = "There are also textboxes, which have cool effects.", TextSize = 20})
JFR.NewTextBox("TextboxExample1", menu1, {Position = UDim2.new(0, 10, 0, 380), Size = UDim2.new(0, 380, 0, 25), Text = "Enter some text!"})

JFR.NewBoard("Dash3", menu1, {Position = UDim2.new(0, 10, 0, 430), Size = UDim2.new(0, 380, 0, 2), BackgroundColor3 = JFR.Theme.shade7, ZIndex = 200})


JFR.NewText("FeaturesText5", menu1, {Position = UDim2.new(0, 10, 0, 450), Size = UDim2.new(0, 400, 0, 25), Text = "Keep in mind that this is still in progress!<br/>Textboxes, dropdowns, sliders, and images are all going<br/>to be supported or expanded upon in the future.", TextSize = 20})
JFR.NewText("FeaturesText6", menu1, {Position = UDim2.new(0, 10, 0, 530), Size = UDim2.new(0, 400, 0, 25), Text = "For questions and answers, click the next tab to your left.", TextSize = 20})



JFR.NewText("QuestionsTitle", menu2, {Position = UDim2.new(0.05, -10, 0, y - 30), Size = UDim2.new(0, 400, 0, 25), Text = "Q / A", TextSize = 20})
JFR.NewText("QuestionsText1", menu2, {Position = UDim2.new(0, 10, 0, 30), BackgroundTransparency = 1, Size = UDim2.new(0, 400, 0, 500), Text = "Will the library be open source?<br/>Yes, but since the UI was designed for only<br/>me to use, it will be insanely hard to work with.<br/><br/>How laggy will the UI be?<br/>Hopefully not too much. I have a really<br/>bad processor and am able to run it.<br/>There will be settings for disabling extra effects,<br/>such as typing particles, so don&apos;t worry.<br/><br/>Will you update your older scripts?<br/>I hope I will get to it over the summer,<br/>but not anytime soon.<br/><br/>Will I be able to edit the themes?<br/>As of now, the color themes are<br/>randomly generated. In the future, you<br/>will be able to change them.<br/><br/>Fix the hoops aimbot!<br/>:up:", TextSize = 22})

JFR.NewText("InfoTitle", menu3, {Position = UDim2.new(0.05, -10, 0, y - 30), Size = UDim2.new(0, 400, 0, 25), Text = "Info", TextSize = 20})
JFR.NewText("InfoText1", menu3, {Position = UDim2.new(0, 10, 0, 30), BackgroundTransparency = 1, Size = UDim2.new(0, 400, 0, 500), Text = "Made by topit", TextSize = 22})


JFR.NewButton("CloseButton", bg, {Position = UDim2.new(1, -30, 0, 5), Size = UDim2.new(0, 25, 0, 25), BackgroundColor3 = JFR.Theme.shade7, Text = "X", TextSize = 14}, {on = function()
    local pb = JFR.GetParentBoard()
    JFR.TweenPosition(pb, UDim2.new(pb.Position.X.Scale, pb.Position.X.Offset, 1.1, 0), 0.75, Enum.EasingDirection.In)
    wait(0.25)
    JFR.FadeOut(pb, 1)
    wait(0.5)
    screen:Destroy() 
end})

JFR.Ready()
