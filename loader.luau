if getgenv().ScriptLoaded then return end ; getgenv().ScriptLoaded = true;
local Services = setmetatable({}, {
    __index = function(table, value, key)
        return (cloneref and cloneref(game:GetService(value))) or game:GetService(value)
    end
})

local CanBuyLuckyPotions = false;
local BuyingLuckyPotion = false;
local SerpentLocation = CFrame.new();
local Serpent_Active = false;
local TeleportingToSerpent = false;
local Fake_Folder = Instance.new("Folder")
local Fake_AFK = Services.ReplicatedStorage.events.afk:Clone();
Fake_AFK.Parent = Fake_Folder
local Real_AFK = Services.ReplicatedStorage.events.afk;

local Config = {
    ["Farming"] = {
        ["FishEnabled"] = false;
        ["PositionStarted"] = CFrame.new();
        ["TeleportToSerpent"] = false;
        ["BuyLuckPotions"] = false;
    };

    ["Misc"] = {
        ["ClickTeleport"] = false;
        ["TeleportBind"] = Enum.KeyCode.LeftControl;
    };

	["Appraiser"] = {
		["Shiny"] = false;
		["Sparkling"] = false;
		["Mutation"] = false;
		["CustomWeight"] = false;
		["Weight"] = 0;
		["WantedMutation"] = "Random";
	};

    ["Locations"] = {["Anicent Isles"] = CFrame.new(6058, 195, 281); ["Rod Crafting"] = CFrame.new(-3160, -747, 1701); ["The Depths"] = CFrame.new(568, -704, 1231); ["Altar"] = CFrame.new(1308, -805, -105); ["Executive HeadQuarters"] = CFrame.new(-33, -247, 200); ["Birch"] = CFrame.new(1742, 142, -2502); ["Deep"] = CFrame.new(-1511, -235, -2853); ["Volcano"] = CFrame.new(-1889, 168, 329); ["Mushgrove"] = CFrame.new(2502, 131, -721); ["Spike"] = CFrame.new(-1255, 138, 1554); ["Forsaken Shores"] = CFrame.new(-2498, 137, 1625); ["Snowcap"] = CFrame.new(2649, 142, 2521); ["Terrapin"] = CFrame.new(-145, 145, 1907); ["Arch"] = CFrame.new(999, 131, -1237); ["Merlin"] = CFrame.new(-932, 224, -987); ["Sunstone"] = CFrame.new(-933, 132, -1119); ["Wilson"] = CFrame.new(2939, 281, 2567); ["Roslit"] = CFrame.new(-1477, 134, 672); ["Brine"] = CFrame.new(-1797, -143, -3442); ["Statue"] = CFrame.new(73, 142, -1028); ["Rod Of Depths"] = CFrame.new(1704, -903, 1439); ["Deep Shop"] = CFrame.new(-979, -245, -2700); ["Vertigo"] = CFrame.new(-112, -515, 1040); ["Moosewood"] = CFrame.new(383, 135, 244);};
};

task.spawn(function()

    task.spawn(function()
        Services.UserInputService.InputBegan:Connect(function(Input , game_event)
            if game_event then return end
            if Input.UserInputType == Enum.UserInputType.MouseButton1 and Config.Misc.ClickTeleport and Services.UserInputService:IsKeyDown(Config.Misc.TeleportBind) then
                local MouseLocation = Services.UserInputService:GetMouseLocation()
                local Ray = Services.Workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
                local RaycastParams = RaycastParams.new()
                RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                RaycastParams.FilterDescendantsInstances = {Services.Players.LocalPlayer.Character}
                local Cast = Services.Workspace:Raycast(Ray.Origin, Ray.Direction * 1000, RaycastParams)
                
                if Cast then
                    Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Cast.Position + Vector3.new(0,3,0))
                end
            end;
        end)
    end)

    task.spawn(function()
        if Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")):FindFirstChild("The Depths - Serpent") then
            Serpent_Active = true
            repeat wait() until Config.Farming.FishEnabled and Config.Farming.TeleportToSerpent
            local Child = Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")):FindFirstChild("The Depths - Serpent")
            if Child.CFrame == CFrame.new(1044.93701, -750.5, 1043.96301, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1044, -737.915894, 1061.99988, 0.994568825, 8.89683172e-09, -0.104081154, -2.41659714e-09, 1, 6.23874712e-08, 0.104081154, -6.17971097e-08, 0.994568825)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(845.593994, -750.5, 1238.32605, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(870.000061, -737.915894, 1244, -0.0187063329, 1.57504854e-09, 0.999825001, -2.61347619e-08, 1, -2.0642954e-09, -0.999825001, -2.6168804e-08, -0.0187063329)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(1414.66699, -750.5, 1251.979, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1392.99878, -743.911743, 1255.99976, -0.113621928, -1.84039415e-08, -0.993524075, -3.34689965e-08, 1, -1.4696302e-08, 0.993524075, 3.15824309e-08, -0.113621928)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(1109.05005, -750.5, 1085.01404, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1096.72095, -737.915771, 1091.03833, 0.286326379, -1.39540979e-09, -0.958132148, 4.5742901e-08, 1, 1.22133352e-08, 0.958132148, -4.73247432e-08, 0.286326379)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(1325.19702, -750.5, 1422.79297, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1331.18066, -735.049805, 1438.88965, 0.999992847, -1.14245244e-08, 0.00378598436, 1.16010126e-08, 1, -4.6594387e-08, -0.00378598436, 4.66379753e-08, 0.999992847)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(1187.64099, -750.5, 1554.33997, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1187.42261, -735.24408, 1571.92981, 0.999870956, -1.09965121e-08, 0.0160649568, 1.12504566e-08, 1, -1.5716946e-08, -0.0160649568, 1.58956546e-08, 0.999870956)
                Serpent_Active = true;
            end
            if Child.CFrame == CFrame.new(1089.53796, -750.5, 1463.92505, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(1097.00818, -740.921997, 1446.5874, -0.963950574, 1.19874439e-08, 0.266081423, 1.29693305e-08, 1, 1.93305505e-09, -0.266081423, 5.31426725e-09, -0.963950574)
                Serpent_Active = true;
            end
			if Child.CFrame == CFrame.new(915.26001, -750.5, 1414.83398, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                SerpentLocation = CFrame.new(937.862549, -734.99707, 1411.31335, 0.109383531, 9.89878188e-08, 0.9939996, -6.568402e-08, 1, -9.23572472e-08, -0.9939996, -5.51875274e-08, 0.109383531)
                Serpent_Active = true;
            end

            local OldCFrame = Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    
            if Config.Farming.TeleportToSerpent then
				TeleportingToSerpent = true
                Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SerpentLocation
				wait(2)
                Services.Players.LocalPlayer.Character.Humanoid:UnequipTools()
				TeleportingToSerpent = false
            end

            local Connection;
            Connection = Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")).ChildRemoved:Connect(function(Child)
                if tostring(Child) == "The Depths - Serpent" then
                    Serpent_Active = false;
                    
                    if Config.Farming.TeleportToSerpent then
						TeleportingToSerpent = true
                        Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
						wait(2)
                        Services.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						TeleportingToSerpent = false
                    end
                    Connection:Disconnect()
                end
            end)
        end

        Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")).ChildAdded:Connect(function(Child)
            if tostring(Child) == "The Depths - Serpent" then
                if Child.CFrame == CFrame.new(1044.93701, -750.5, 1043.96301, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1044, -737.915894, 1061.99988, 0.994568825, 8.89683172e-09, -0.104081154, -2.41659714e-09, 1, 6.23874712e-08, 0.104081154, -6.17971097e-08, 0.994568825)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(845.593994, -750.5, 1238.32605, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(870.000061, -737.915894, 1244, -0.0187063329, 1.57504854e-09, 0.999825001, -2.61347619e-08, 1, -2.0642954e-09, -0.999825001, -2.6168804e-08, -0.0187063329)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(1414.66699, -750.5, 1251.979, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1392.99878, -743.911743, 1255.99976, -0.113621928, -1.84039415e-08, -0.993524075, -3.34689965e-08, 1, -1.4696302e-08, 0.993524075, 3.15824309e-08, -0.113621928)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(1109.05005, -750.5, 1085.01404, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1096.72095, -737.915771, 1091.03833, 0.286326379, -1.39540979e-09, -0.958132148, 4.5742901e-08, 1, 1.22133352e-08, 0.958132148, -4.73247432e-08, 0.286326379)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(1325.19702, -750.5, 1422.79297, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1331.18066, -735.049805, 1438.88965, 0.999992847, -1.14245244e-08, 0.00378598436, 1.16010126e-08, 1, -4.6594387e-08, -0.00378598436, 4.66379753e-08, 0.999992847)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(1187.64099, -750.5, 1554.33997, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1187.42261, -735.24408, 1571.92981, 0.999870956, -1.09965121e-08, 0.0160649568, 1.12504566e-08, 1, -1.5716946e-08, -0.0160649568, 1.58956546e-08, 0.999870956)
                    Serpent_Active = true;
                end
                if Child.CFrame == CFrame.new(1089.53796, -750.5, 1463.92505, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    SerpentLocation = CFrame.new(1097.00818, -740.921997, 1446.5874, -0.963950574, 1.19874439e-08, 0.266081423, 1.29693305e-08, 1, 1.93305505e-09, -0.266081423, 5.31426725e-09, -0.963950574)
                    Serpent_Active = true;
                end
				if Child.CFrame == CFrame.new(915.26001, -750.5, 1414.83398, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
					SerpentLocation = CFrame.new(937.862549, -734.99707, 1411.31335, 0.109383531, 9.89878188e-08, 0.9939996, -6.568402e-08, 1, -9.23572472e-08, -0.9939996, -5.51875274e-08, 0.109383531)
					Serpent_Active = true;
				end
				if Child.CFrame == CFrame.new(915.26001, -750.5, 1414.83398, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
					SerpentLocation = CFrame.new(937.862549, -734.99707, 1411.31335, 0.109383531, 9.89878188e-08, 0.9939996, -6.568402e-08, 1, -9.23572472e-08, -0.9939996, -5.51875274e-08, 0.109383531)
					Serpent_Active = true;
				end

                local OldCFrame = Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    
                if Config.Farming.TeleportToSerpent then
					TeleportingToSerpent = true
                    Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SerpentLocation
					wait(2)
                    Services.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					TeleportingToSerpent = false
                end

                local Connection;
                Connection = Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")).ChildRemoved:Connect(function(Child)
                    if tostring(Child) == "The Depths - Serpent" then
                        Serpent_Active = false;
                        
                        if Config.Farming.TeleportToSerpent then
							TeleportingToSerpent = true
                            Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
							wait(2)
                            Services.Players.LocalPlayer.Character.Humanoid:UnequipTools()
							TeleportingToSerpent = false
                        end
                        Connection:Disconnect()
                    end
                end)
            end
        end)
    end)

    task.spawn(function()
        while task.wait() do
            if Config.Farming.FishEnabled == false then continue end
            if not Serpent_Active then continue end
            if Config.Farming.TeleportToSerpent == false then continue end
            if BuyingLuckyPotion then continue end

            Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SerpentLocation
        end
    end)

    task.spawn(function()
        while task.wait() do
			if TeleportingToSerpent then continue end
            if not Config.Farming.FishEnabled then continue end
            if BuyingLuckyPotion then continue end
            if (Serpent_Active and Config.Farming.TeleportToSerpent) then continue end
            if not Services.Players.LocalPlayer.Character or not Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then continue end
            Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config.Farming.PositionStarted
        end
    end)

    task.spawn(function()
        while task.wait() do
			if TeleportingToSerpent then continue end
            if not Config.Farming.BuyLuckPotions then continue end
            if not CanBuyLuckyPotions then continue end
            if BuyingLuckyPotion then continue end
            if not Services.Players.LocalPlayer.Character or not Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then continue end
            if Services.Players.LocalPlayer.PlayerGui.hud.safezone.statuses:FindFirstChild("statusUI") then continue end

            BuyingLuckyPotion = true
            task.spawn(function()
                task.wait(4)
                BuyingLuckyPotion = false
            end)

            local OldCFrame = Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame

            task.spawn(function()
                repeat task.wait() Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config.Locations["Merlin"] until BuyingLuckyPotion == false
            end)

            task.wait(2.5)
            pcall(function()
            	Services.Workspace:FindFirstChild(string.lower("World")):FindFirstChild(string.lower("NPCS")):FindFirstChild("Merlin"):FindFirstChild("Merlin"):FindFirstChild(string.lower("Luck")):InvokeServer()
            end)
            task.wait(0.5)

            BuyingLuckyPotion = false

            Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldCFrame
        end
    end)

	while task.wait() do
		if TeleportingToSerpent then continue end
        if not Config.Farming.FishEnabled then continue end
        if BuyingLuckyPotion then continue end
        if not Services.Players.LocalPlayer.Character or not Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then continue end
        repeat task.wait() until BuyingLuckyPotion == false

        local Rod_Value = Services.ReplicatedStorage:FindFirstChild(tostring(Services.Players.LocalPlayer), true).Stats.rod.Value

		if Services.Players.LocalPlayer.Backpack:FindFirstChild(Rod_Value) then
			Services.Players.LocalPlayer.Character.Humanoid:EquipTool(Services.Players.LocalPlayer.Backpack:FindFirstChild(Rod_Value))
		end

        CanBuyLuckyPotions = false
		if Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value) and Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value):FindFirstChild("bobber") then
            local Serpent_Fix = false
            task.spawn(function()
                task.wait(10)
                Serpent_Fix = true
            end)

			repeat
				pcall(function()
					Services.Players.LocalPlayer.PlayerGui:FindFirstChild(string.lower("ShakeUI")).safezone:FindFirstChild(string.lower("Button")).Size = UDim2.new(1001, 0, 1001, 0)
					Services.VirtualUser:Button1Down(Vector2.new(1, 1))
					Services.VirtualUser:Button1Up(Vector2.new(1, 1))
				end)
				Services.RunService.Heartbeat:Wait()

			until not Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value) or Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value).values.bite.Value or Serpent_Fix == true

			repeat
				Services.ReplicatedStorage:FindFirstChild(string.lower("ReelFinished"), true):FireServer(1000000000000000000000000, true)
				Services.RunService.Heartbeat:Wait()

			until not Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value) or not Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value).values.bite.Value or Serpent_Fix == true
			if Serpent_Fix then
				Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value):FindFirstChild(string.lower("Events")):FindFirstChild(string.lower("Cast")):FireServer(1000000000000000000000000)
			end
		else
			Services.Players.LocalPlayer.Character:FindFirstChild(Rod_Value):FindFirstChild(string.lower("Events")):FindFirstChild(string.lower("Cast")):FireServer(1000000000000000000000000)
			Services.RunService.Heartbeat:Wait()
            CanBuyLuckyPotions = true
		end
	end
end)

local Library, Notifications = loadstring((request or http_request or http and http.request)({Url = "https://raw.githubusercontent.com/IrishGypsyUser/UI-Library/refs/heads/main/loader.luau", Method = "GET"}).Body)()
local Window = Library:Window({Name = "Fisch [🐟]"})
local Solara, Xeno, Seliware, Awp = getexecutorname() == "Solara", (getexecutorname() == "Xeno" or getexecutorname() == "JJSploit x Xeno"), string.match(getexecutorname(), "Seliware") == "Seliware", getexecutorname() == "AWP"

if not isfolder("FischScript") then
    makefolder("FischScript")
end

if not isfolder("FischScript/Waypoints") then
    makefolder("FischScript/Waypoints")
end

do
	local Pages = {
		["Aiming"] = Window:Page({Name = "Main", Icon = "rbxassetid://6034509987"});
		["Settings"] = Window:Page({Name = "Settings", Icon = "rbxassetid://6031280882"});
	}

    do
        local Section = Pages["Aiming"]:Section({Name = "Auto Farm"})

        Section:Toggle({Name = "Enabled", Callback = function(state)
            Config.Farming.FishEnabled = state
            if Config.Farming.FishEnabled then
                Config.Farming.PositionStarted = Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end})

        Section:Toggle({Name = "Farm Ancient Serpents", Callback = function(state)
            Config.Farming.TeleportToSerpent = state
        end})

        Section:Toggle({Name = "Auto Buy Luck", Callback = function(state)
            Config.Farming.BuyLuckPotions = state
        end})
		
		Section:Label({Name = "Talk to Merlin before using auto luck."})
    end

    do
		if (not Solara) and (not Xeno) and (not Seliware) and (not Awp) then
			local Section = Pages["Aiming"]:Section({Name = "Waypoints"})

			local WayPointName;

			local function toVector3(String, Separator)
				local Separator = Separator or ','
			
				local axes = {}
			
				for axis in String:gmatch('[^'..Separator..']+') do
					axes[#axes + 1] = axis
				end
			
				return Vector3.new(axes[1], axes[2], axes[3])
			end

			local Selected_Waypoint;
			local Waypoint_List = Section:List({Name = "Waypoints", Flag = "Waypoints", Options = {}, Default = 1, Callback = function(Value)
				if Value == nil then return end
				Selected_Waypoint = Value
			end})

			Section:Textbox({Flag = "Waypoint Name", Name = "Waypoint Name", Callback = function(Value)
				WayPointName = tostring(Value)
			end})

			Section:Button({Name = "Teleport To Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(toVector3(readfile("FischScript/Waypoints/"..Selected_Waypoint), ","))
			end})

			Section:Button({Name = "Save Waypoint", Callback = function()
				if WayPointName == nil then return end
				writefile("FischScript/Waypoints/"..WayPointName, tostring(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
			end})

			Section:Button({Name = "Delete Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				delfile("FischScript/Waypoints/"..Selected_Waypoint)
			end})

			Section:Button({Name = "Refresh List", Callback = function()
				local Waypoints = {}
		
				for i,v in listfiles("FischScript/Waypoints") do
					local Slash = tostring(string.gsub(v, [[FischScript/Waypoints\]], ""))
					table.insert(Waypoints, Slash)
				end
		
				table.sort(Waypoints, function(A, B)
					return A<B
				end)
		
				Waypoint_List:Refresh(Waypoints)
			end})

			local Waypoints = {}
		
			for i,v in listfiles("FischScript/Waypoints") do
				local Slash = tostring(string.gsub(v, [[FischScript/Waypoints\]], ""))
				table.insert(Waypoints, Slash)
			end

			table.sort(Waypoints, function(A, B)
				return A<B
			end)

			Waypoint_List:Refresh(Waypoints)
		elseif Solara then
			local Section = Pages["Aiming"]:Section({Name = "Waypoints"})

			local WayPointName;

			local function toVector3(String, Separator)
				local Separator = Separator or ','
			
				local axes = {}
			
				for axis in String:gmatch('[^'..Separator..']+') do
					axes[#axes + 1] = axis
				end
			
				return Vector3.new(axes[1], axes[2], axes[3])
			end

			local Selected_Waypoint;
			local Waypoint_List = Section:List({Name = "Waypoints", Flag = "Waypoints", Options = {}, Default = 1, Callback = function(Value)
				if Value == nil then return end
				Selected_Waypoint = Value
			end})

			Section:Textbox({Flag = "Waypoint Name", Name = "Waypoint Name", Callback = function(Value)
				WayPointName = tostring(Value)
			end})

			Section:Button({Name = "Teleport To Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(toVector3(readfile("FischScript/Waypoints/"..Selected_Waypoint), ","))
			end})

			Section:Button({Name = "Save Waypoint", Callback = function()
				if WayPointName == nil then return end
				writefile("FischScript/Waypoints/"..WayPointName, tostring(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
			end})

			Section:Button({Name = "Delete Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				delfile("FischScript/Waypoints/"..Selected_Waypoint)
			end})

			Section:Button({Name = "Refresh List", Callback = function()
				local Waypoints = {}
		
				for i,v in listfiles("FischScript/Waypoints") do
					local Slash = tostring(string.gsub(v, [[FischScript/Waypoints/]], ""))
					table.insert(Waypoints, Slash)
				end
		
				table.sort(Waypoints, function(A, B)
					return A<B
				end)
		
				Waypoint_List:Refresh(Waypoints)
			end})

			local Waypoints = {}
		
			for i,v in listfiles("FischScript/Waypoints") do
				local Slash = tostring(string.gsub(v, [[FischScript/Waypoints/]], ""))
				table.insert(Waypoints, Slash)
			end

			table.sort(Waypoints, function(A, B)
				return A<B
			end)

			Waypoint_List:Refresh(Waypoints)
		elseif Seliware or Awp then
			local Section = Pages["Aiming"]:Section({Name = "Waypoints"})
	
			local WayPointName;
	
			local function toVector3(String, Separator)
				local Separator = Separator or ','
			
				local axes = {}
			
				for axis in String:gmatch('[^'..Separator..']+') do
					axes[#axes + 1] = axis
				end
			
				return Vector3.new(axes[1], axes[2], axes[3])
			end
	
			local Selected_Waypoint;
			local Waypoint_List = Section:List({Name = "Waypoints", Flag = "Waypoints", Options = {}, Default = 1, Callback = function(Value)
				if Value == nil then return end
				Selected_Waypoint = Value
			end})
	
			Section:Textbox({Flag = "Waypoint Name", Name = "Waypoint Name", Callback = function(Value)
				WayPointName = tostring(Value)
			end})
	
			Section:Button({Name = "Teleport To Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(toVector3(readfile([[FischScript\Waypoints\]]..Selected_Waypoint), ","))
			end})
	
			Section:Button({Name = "Save Waypoint", Callback = function()
				if WayPointName == nil then return end
				writefile([[FischScript\Waypoints\]]..WayPointName, tostring(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
			end})
	
			Section:Button({Name = "Delete Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				delfile([[FischScript\Waypoints\]]..Selected_Waypoint)
			end})
	
			Section:Button({Name = "Refresh List", Callback = function()
				local Waypoints = {}
		
				for i,v in listfiles([[FischScript\Waypoints]]) do
					local Slash = tostring(string.gsub(v, [[FischScript\Waypoints\]], ""))
					table.insert(Waypoints, Slash)
				end
		
				table.sort(Waypoints, function(A, B)
					return A<B
				end)
		
				Waypoint_List:Refresh(Waypoints)
			end})
	
			local Waypoints = {}
		
			for i,v in listfiles([[FischScript\Waypoints]]) do
				local Slash = tostring(string.gsub(v, [[FischScript\Waypoints\]], ""))
				table.insert(Waypoints, Slash)
			end
	
			table.sort(Waypoints, function(A, B)
				return A<B
			end)
	
			Waypoint_List:Refresh(Waypoints)
		elseif Xeno then
			local Section = Pages["Aiming"]:Section({Name = "Waypoints"})

			local WayPointName;

			local function toVector3(String, Separator)
				local Separator = Separator or ','
			
				local axes = {}
			
				for axis in String:gmatch('[^'..Separator..']+') do
					axes[#axes + 1] = axis
				end
			
				return Vector3.new(axes[1], axes[2], axes[3])
			end

			local Selected_Waypoint;
			local Waypoint_List = Section:List({Name = "Waypoints", Flag = "Waypoints", Options = {}, Default = 1, Callback = function(Value)
				if Value == nil then return end
				Selected_Waypoint = Value
			end})

			Section:Textbox({Flag = "Waypoint Name", Name = "Waypoint Name", Callback = function(Value)
				WayPointName = tostring(Value)
			end})

			Section:Button({Name = "Teleport To Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(toVector3(readfile("FischScript/Waypoints/"..Selected_Waypoint), ","))
			end})

			Section:Button({Name = "Save Waypoint", Callback = function()
				if WayPointName == nil then return end
				writefile("FischScript/Waypoints/"..WayPointName, tostring(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
			end})

			Section:Button({Name = "Delete Waypoint", Callback = function()
				if Selected_Waypoint == nil then return end
				delfile("FischScript/Waypoints/"..Selected_Waypoint)
			end})

			Section:Button({Name = "Refresh List", Callback = function()
				task.spawn(function()
					task.wait(1.5)
					local Waypoints = {}
			
					for i,v in listfiles("FischScript/Waypoints") do
						local Slash = tostring(string.gsub(v, [[./FischScript/Waypoints/]], ""))
						table.insert(Waypoints, Slash)
					end
			
					table.sort(Waypoints, function(A, B)
						return A<B
					end)
			
					Waypoint_List:Refresh(Waypoints)
				end)
			end})

			local Waypoints = {}
		
			for i,v in listfiles("FischScript/Waypoints") do
				local Slash = tostring(string.gsub(v, [[./FischScript/Waypoints/]], ""))
				table.insert(Waypoints, Slash)
			end

			table.sort(Waypoints, function(A, B)
				return A<B
			end)

			Waypoint_List:Refresh(Waypoints)
		end
    end

    do
        local Section = Pages["Aiming"]:Section({Name = "Miscellaneous", Side = "Left"})

        local antiafk_enabled = false;

        Section:Toggle({Name = "Anti Idle", Callback = function(state)
            if antiafk_enabled == false then
				if state then
					task.spawn(function()
						while true do
							local GC = getconnections or get_signal_cons
							if GC and (not Solara) and (not Xeno) then
								for i,v in pairs(GC(Services.Players.LocalPlayer.Idled)) do
									if v["Disable"] then
										v["Disable"](v)
									elseif v["Disconnect"] then
										v["Disconnect"](v)
									end
								end
							else
								Services.Players.LocalPlayer.Idled:Connect(function()
									Services.VirtualUser:CaptureController()
									Services.VirtualUser:ClickButton2(Vector2.new())
								end)
							end
							
							task.wait(300)
						end
					end)
				end
            end
            if state then
                antiafk_enabled = true;
                Real_AFK.Parent = Fake_Folder
                Fake_AFK.Parent = Services.ReplicatedStorage.events
            else
                Real_AFK.Parent = Services.ReplicatedStorage.events
                Fake_AFK.Parent = Fake_Folder
            end
        end})

        Section:Toggle({Name = "Click Teleport", Callback = function(state)
            Config.Misc.ClickTeleport = state
        end})

        Section:Keybind({Name = "Teleport Key", Flag = "Teleport_Key", Ignore = true, UseKey = true, Default = Enum.KeyCode.LeftControl, Callback = function(State) Config.Misc.TeleportBind = State end})
    end

    do
        local Section = Pages["Aiming"]:Section({Name = "Teleports", Title = "Teleports", Side = "Right"})
        local TeleportOptions = {}
        for Index, Value in Config.Locations do
            table.insert(TeleportOptions, Index)
        end

        table.sort(TeleportOptions, function(A, B)
            return A<B
        end)

        Section:List({Name = "Teleports", Flag = "Teleports", Options = TeleportOptions, Default = 1, Callback = function(Value)
            if Value == nil then return end
            Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Config.Locations[Value]
        end})

        local Event_List = Section:List({Name = "Events", Flag = "Events", Options = {}, Default = 1, Callback = function(Value)
            if Value == nil then return end
            Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing"))[Value].CFrame + Vector3.new(0,75,0)
        end})

        local Events = {}
        for Index, Value in Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")):GetChildren() do
            if string.match(tostring(Value):lower(), "ocean") then continue end
            if Value:FindFirstChildOfClass("Beam") or tostring(Value) == "The Depths - Serpent" then
                table.insert(Events, tostring(Value))
            end
        end

        Event_List:Refresh(Events)

        Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")).ChildAdded:Connect(function(Child)
            table.clear(Events)
            for Index, Value in Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")):GetChildren() do
                if string.match(tostring(Value):lower(), "ocean") then continue end
                if Value:FindFirstChildOfClass("Beam") or tostring(Value) == "The Depths - Serpent" then
                    table.insert(Events, tostring(Value))
                end
            end

            Event_List:Refresh(Events)
        end)

        Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")).ChildRemoved:Connect(function(Child)
            table.clear(Events)
            for Index, Value in Services.Workspace:FindFirstChild(string.lower("Zones")):FindFirstChild(string.lower("Fishing")):GetChildren() do
                if string.match(tostring(Value):lower(), "ocean") then continue end
                if Value:FindFirstChildOfClass("Beam") or tostring(Value) == "The Depths - Serpent" then
                    table.insert(Events, tostring(Value))
                end
            end

            Event_List:Refresh(Events)
        end)

        local Serpent_Label = Section:Label({Name = "Depth Serpent Active : "..(Serpent_Active == true and "✅" or "❌")})

        task.spawn(function()
            while task.wait(1) do
                Serpent_Label:SetText("Depth Serpent Active : "..(Serpent_Active == true and "✅" or Serpent_Active == false and "❌"))
            end
        end)
    end

	do
        local Section = Pages["Aiming"]:Section({Name = "Appraiser", Title = "Appraiser", Side = "Right", Zindex = -500})

		Section:Toggle({Name = "Shiny", Callback = function(state)
            Config.Appraiser.Shiny = state
        end})

		Section:Toggle({Name = "Sparkling", Callback = function(state)
            Config.Appraiser.Sparkling = state
        end})

		Section:Toggle({Name = "Mutation", Callback = function(state)
            Config.Appraiser.Mutation = state
        end})

		Section:Toggle({Name = "Custom Weight", Callback = function(state)
            Config.Appraiser.CustomWeight = state
        end})

		Section:Textbox({Flag = "Weight_Value", Name = "Weight", Callback = function(state)
            Config.Appraiser.Weight = tonumber(state)
        end})

		Section:List({Name = "Mutation", Flag = "Mutation_Flag", Options = {"Random";"Mythical";"Abyssal";"Lunar";"Midas";"Glossy";"Silver";"Mosaic";"Hexed";"Electric";"Darkened";"Translucent";"Frozen";"Negative";"Albino"}, Default = "Random", Callback = function(Value)
            if Value == nil then return end
			Config.Appraiser.WantedMutation = Value
        end})

		local function CheckFish(Link)
			local Checks = true

			if Config.Appraiser.Mutation then 
				if Link:FindFirstChild("Mutation") then
					if Config.Appraiser.WantedMutation == "Random" then
						Checks = true
					else
						Checks = Link:FindFirstChild("Mutation").Value == Config.Appraiser.WantedMutation
					end
				else
					Checks = false
				end
			end

			if Checks == false then return false end
			if Config.Appraiser.Sparkling then Checks = Link:FindFirstChild("Sparkling") and true or not Link:FindFirstChild("Sparkling") and false end
			if Checks == false then return false end
			if Config.Appraiser.Shiny then Checks = Link:FindFirstChild("Shiny") and true or not Link:FindFirstChild("Shiny") and false end
			if Checks == false then return false end
			if Config.Appraiser.CustomWeight then Checks = Link.Weight.Value >= Config.Appraiser.Weight end
			

			return Checks
		end

		local StopAppraising = false;
		Section:Button({Name = "Start Appraising (Hold Fish)", Callback = function()
			task.spawn(function()
				local Fish = tostring(Services.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))

				if Fish == "nil" then return end

				while task.wait(.1) do
					if Services.Players.LocalPlayer.Backpack:FindFirstChild(Fish) then
						Services.Players.LocalPlayer.Character.Humanoid:EquipTool(Services.Players.LocalPlayer.Backpack:FindFirstChild(Fish))
					end
					
					local Temp_Fish;

					pcall(function()
						Temp_Fish = Services.Players.LocalPlayer.Character:FindFirstChild(Fish)
					end)

					if not Temp_Fish then continue end
					if not Temp_Fish:FindFirstChild(string.lower("Link")) then continue end

					local Link = Temp_Fish:FindFirstChild(string.lower("Link")).Value

					if CheckFish(Link) or StopAppraising then
						break
					end
				
					pcall(function()
						task.spawn(function()
							pcall(function()
								Services.Workspace:FindFirstChild(string.lower("World")):FindFirstChild(string.lower("NPCS")):FindFirstChild("Appraiser"):FindFirstChild(string.lower("Appraiser")):FindFirstChild(string.lower("Appraise")):InvokeServer()
							end)
						end)
					end)
				end
			end)
		end})

		Section:Button({Name = "Stop Appraising", Callback = function()
			task.spawn(function()
				StopAppraising = true;
				task.wait(1)
				StopAppraising = false;
			end)
		end})
    end

	do
        local Section = Pages["Aiming"]:Section({Name = "Servers", Side = "Right", Zindex = -1000})

		Section:Button({Name = "Server Hop", Callback = function()
			-- skidded
			task.spawn(function()
				local httprequest = request or http_request
				if httprequest then
					local servers = {}
					local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
					local body = Services.HttpService:JSONDecode(req.Body)
				
					if body and body.data then
						for i, v in next, body.data do
							if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
								table.insert(servers, 1, v.id)
							end
						end
					end
				
					if #servers > 0 then
						Services.TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Services.Players.LocalPlayer)
					else
						return Notifications:Notification("[🐟] Couldnt Find Server!", 7.5, Library.Accent, false)
					end
				end
			end)
		end})
    end

	do -- Settings
		local Config = Pages["Settings"]:Section({Name = "Config"})
		local ConfigList = Config:List({Name = "Config", Flag = "SettingConfigurationList", Options = {}})
		Config:Textbox({Flag = "SettingsConfigurationName", Name = "Config Name"})
		Config:Button({Name = "Save"})
		Config:Button({Name = "Load"})
		Config:Button({Name = "Delete"})
		Config:Button({Name = "Refresh"})
		Config:Keybind({Name = "Menu Key", Flag = "MenuKey", Ignore = true, UseKey = true, Default = Enum.KeyCode.End, Callback = function(State) Library.UIKey = State end})
	end
end

Notifications:Notification("[🐟] Loaded Joyce's Fisch Script!", 10, Library.Accent, false)
