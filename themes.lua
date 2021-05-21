_G.JFRTheme_Dark = {
	Color3.fromRGB(25, 25, 25),   
	Color3.fromRGB(10, 10, 10),   
	Color3.fromRGB(40, 40, 40),   
	Color3.fromRGB(35, 35, 35),   
	Color3.fromRGB(20, 20, 20),   
	Color3.fromRGB(25, 100, 45),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
_G.JFRTheme_Steel = {
	Color3.fromRGB(25, 25, 35),   
	Color3.fromRGB(10, 10, 20),   
	Color3.fromRGB(40, 40, 50),   
	Color3.fromRGB(35, 35, 45),   
	Color3.fromRGB(20, 20, 25),   
	Color3.fromRGB(25, 100, 55),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
_G.JFRTheme_Rust = {
	Color3.fromRGB(45, 25, 25),   
	Color3.fromRGB(30, 10, 10),   
	Color3.fromRGB(60, 40, 40),   
	Color3.fromRGB(55, 35, 35),   
	Color3.fromRGB(40, 20, 20),   
	Color3.fromRGB(45, 100, 45),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(255, 245, 255),
	Color3.fromRGB(175, 155, 255) 
}
_G.JFRTheme_Violet = {
	Color3.fromRGB(35, 25, 45),   
	Color3.fromRGB(20, 10, 30),   
	Color3.fromRGB(50, 40, 60),   
	Color3.fromRGB(45, 35, 55),   
	Color3.fromRGB(30, 20, 40),   
	Color3.fromRGB(35, 100, 65),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
_G.JFRTheme_Space = {
	Color3.fromRGB(10, 10, 10),   
	Color3.fromRGB(0, 0, 0),   
	Color3.fromRGB(20, 20, 20),   
	Color3.fromRGB(15, 15, 15),   
	Color3.fromRGB(5, 5, 5),   
	Color3.fromRGB(20, 25, 50),
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
_G.JFRTheme_Ocean = {
	Color3.fromRGB(25, 35, 40),   
	Color3.fromRGB(10, 20, 25),   
	Color3.fromRGB(40, 50, 55),   
	Color3.fromRGB(35, 45, 50),   
	Color3.fromRGB(20, 30, 30),   
	Color3.fromRGB(25, 110, 60),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 255, 255),
	Color3.fromRGB(155, 165, 255) 
}

_G.JFRSelectedTheme = math.random(1,6)
if _G.JFRSelectedTheme == 1 then
    _G.JFRSelectedTheme = _G.JFRTheme_Steel
elseif _G.JFRSelectedTheme == 2 then
    _G.JFRSelectedTheme = _G.JFRTheme_Dark
elseif _G.JFRSelectedTheme == 3 then
    _G.JFRSelectedTheme = _G.JFRTheme_Rust
elseif _G.JFRSelectedTheme == 4 then
    _G.JFRSelectedTheme = _G.JFRTheme_Violet
elseif _G.JFRSelectedTheme == 5 then
    _G.JFRSelectedTheme = _G.JFRTheme_Space
elseif _G.JFRSelectedTheme == 6 then
    _G.JFRSelectedTheme = _G.JFRTheme_Ocean
end


_G.JFRThemesLoaded = true
