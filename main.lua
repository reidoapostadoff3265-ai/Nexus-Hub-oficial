-- ==================== SETUP ====================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer

-- ==================== INTRO ====================
local introGUI = Instance.new("ScreenGui")
introGUI.Name = "IntroUI"
introGUI.Parent = player:WaitForChild("PlayerGui")
introGUI.IgnoreGuiInset = true
introGUI.ResetOnSpawn = false

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BorderSizePixel = 0
bg.Parent = introGUI

local title = Instance.new("TextLabel")
title.Text = "Nexus Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.AnchorPoint = Vector2.new(0.5,0.5)
title.Position = UDim2.fromScale(0.5,0.4)
title.Size = UDim2.fromScale(0.6,0.2)
title.Parent = bg

local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.5,0,0.03,0)
barBG.Position = UDim2.fromScale(0.25,0.65)
barBG.BackgroundColor3 = Color3.fromRGB(60,0,60)
barBG.BorderSizePixel = 0
barBG.Parent = bg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(170,0,255)
barFill.BorderSizePixel = 0
barFill.Parent = barBG

-- Partículas
local function createSquare()
    local sq = Instance.new("Frame")
    sq.Size = UDim2.fromOffset(math.random(30,60),math.random(30,60))
    sq.Position = UDim2.fromScale(math.random(),-0.1)
    sq.BackgroundTransparency = 1
    sq.AnchorPoint = Vector2.new(0.5,0.5)
    sq.Parent = bg
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.3,0)
    corner.Parent = sq
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(255,140,0)
    stroke.Parent = sq
    task.spawn(function()
        local rotation = math.random(-30,30)
        local duration = math.random(4,7)
        local goal = {Position = UDim2.fromScale(math.random(),1.2),Rotation = rotation}
        local tween = TweenService:Create(sq,TweenInfo.new(duration,Enum.EasingStyle.Linear),goal)
        tween:Play()
        tween.Completed:Wait()
        sq:Destroy()
    end)
end

task.spawn(function()
    while introGUI.Parent do
        createSquare()
        task.wait(0.2)
    end
end)

TweenService:Create(barFill,TweenInfo.new(5,Enum.EasingStyle.Linear),{Size = UDim2.new(1,0,1,0)}):Play()

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9044739323"
sound.Volume = 1
sound.Looped = false
sound.Parent = introGUI
sound:Play()

task.delay(5,function()
    local fadeTween = TweenService:Create(bg,TweenInfo.new(1),{BackgroundTransparency = 1})
    fadeTween:Play()
    for _,obj in ipairs(bg:GetDescendants()) do
        if obj:IsA("TextLabel") then
            TweenService:Create(obj,TweenInfo.new(1),{TextTransparency=1}):Play()
        elseif obj:IsA("Frame") then
            TweenService:Create(obj,TweenInfo.new(1),{BackgroundTransparency=1}):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj,TweenInfo.new(1),{Transparency=1}):Play()
        end
    end
    fadeTween.Completed:Wait()
    introGUI:Destroy()
end)

-- ==================== HUB ====================
local hubGUI = Instance.new("ScreenGui")
hubGUI.Name = "NexusHubGUI"
hubGUI.Parent = player:WaitForChild("PlayerGui")
hubGUI.IgnoreGuiInset = true
hubGUI.ResetOnSpawn = false

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
    Parent = hubGUI,
    Title = "Nexus Hub | Brookhaven 1.0",
    SubTitle = "by GhostFox",
    SaveFolder = "Versão 1.0 | nexus hub",
    Theme = {
        Background = Color3.fromRGB(40,0,70),
        TabBackground = Color3.fromRGB(60,0,100),
        Accent = Color3.fromRGB(200,0,255),
        Text = Color3.fromRGB(255,255,255),
    }
})

Window:AddMinimizeButton({
    Button = {Image="rbxassetid://93408381599498",BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(128,0,255)},
    Corner = {CornerRadius=UDim.new(1,0)}
})

local function MakeTabWithIcon(name,iconID)
    local tab = Window:MakeTab({Title=name,Icon=""})
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(0,25,0,25)
    img.Position = UDim2.new(0,10,0.5,-12)
    img.BackgroundTransparency = 1
    img.Image = iconID
    img.Parent = tab.Button
    return tab
end

-- ==================== TABS ====================
local MainTab = MakeTabWithIcon("Créditos","rbxassetid://108356968381894")
local FunTab = MakeTabWithIcon("Fun","rbxassetid://71370142736621")
local AvatarTab = MakeTabWithIcon("Avatar","rbxassetid://13285615784")
local HouseTab = MakeTabWithIcon("House","rbxassetid://127626368577508")
local CarTab = MakeTabWithIcon("Car","rbxassetid://13732918747")
local RainbowTab = MakeTabWithIcon("Rainbow","rbxassetid://9749998556")
local MusicAllTab = MakeTabWithIcon("Music All","rbxassetid://7059338419")
local MusicTab = MakeTabWithIcon("Music","rbxassetid://7059338419")
local TrollTab = MakeTabWithIcon("Scripts Trolls","rbxassetid://13364900349")
local SpamTab = MakeTabWithIcon("Spam","rbxassetid://14895333477")
local PremiumTab = MakeTabWithIcon("Premium","rbxassetid://10885647377")
local AdminTab = MakeTabWithIcon("Admin","rbxassetid://11656483343")

Window:SelectTab(MainTab)

-- ==================== MAIN TAB ====================
MainTab:AddSection({"Nexus hub em processo..."})
MainTab:AddParagraph({"Criadores","By GhostFox"})
MainTab:AddParagraph({"Executor","Delta"})
MainTab:AddDiscordInvite({
    Name="Nexus Hub || Beta",
    Description="Join server",
    Logo="rbxassetid://93408381599498",
    Invite="https://discord.gg/JK25f4kJSw"
})

-- ==================== FUN TAB ====================
-- Velocidade
FunTab:AddSlider({Title="Velocidade",Description="Muda sua velocidade",Min=16,Max=200,Default=16,Callback=function(value)
    local char = player.Character
    if char then char:FindFirstChildOfClass("Humanoid").WalkSpeed = value end
end})

-- Super Pulo
FunTab:AddSlider({Title="Super Pulo",Description="Aumenta altura do pulo",Min=50,Max=500,Default=50,Callback=function(value)
    local char = player.Character
    if char then char:FindFirstChildOfClass("Humanoid").JumpPower = value end
end})

-- Fly
FunTab:AddButton({Title="Ativar Fly",Description="Permite voar livremente",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thraxxyz/SkibidiScripts/refs/heads/main/FlyV1"))()
end})

-- Float toggle
local floatEnabled = false
FunTab:AddToggle({Title="Float",Description="Ativa/Desativa float",Default=false,Callback=function(state)
    floatEnabled = state
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        if floatEnabled then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1e5,1e5,1e5)
            bv.Velocity = Vector3.new(0,5,0)
            bv.Name = "FloatBV"
            bv.Parent = hrp
        else
            local bv = hrp:FindFirstChild("FloatBV")
            if bv then bv:Destroy() end
        end
    end
end})

-- NoClip
FunTab:AddButton({Title="Ativar NoClip",Description="Atravessa paredes",Callback=function()
    loadstring(game:HttpGet("https://pastebin.com/raw/6mrYTdQv"))()
end})

-- Mini
FunTab:AddButton({Title="Virar Mini",Description="Personagem pequeno",Callback=function()
    local char = player.Character
    for _,p in pairs(char:GetChildren()) do
        if p:IsA("BasePart") then p.Size = p.Size*0.5 end
    end
end})

-- Animações
FunTab:AddDropdown({Title="Animações Extras",Description="Escolha animação",Values={"Dab","Floss","Gangnam","Moonwalk","Cair Dramático"},Callback=function(anim)
    local a = Instance.new("Animation")
    if anim=="Dab"then a.AnimationId="rbxassetid://248263260"
    elseif anim=="Floss"then a.AnimationId="rbxassetid://5917459365"
    elseif anim=="Gangnam"then a.AnimationId="rbxassetid://3189773368"
    elseif anim=="Moonwalk"then a.AnimationId="rbxassetid://313762630"
    elseif anim=="Cair Dramático"then a.AnimationId="rbxassetid://5319828216" end
    local h = player.Character:FindFirstChildOfClass("Humanoid")
    if h then h:LoadAnimation(a):Play() end
end})

-- Explosão Fake
FunTab:AddButton({Title="Explosão Fake",Description="Explosão que mata quem estiver perto",Callback=function()
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local exp = Instance.new("Explosion")
        exp.Position = hrp.Position
        exp.BlastRadius = 20
        exp.BlastPressure = 0
        exp.Parent = workspace
        exp.Hit:Connect(function(part)
            local h = part.Parent:FindFirstChildOfClass("Humanoid")
            if h then h.Health = 0 end
        end)
    end
end})

-- Bola de Fogo Fake
local fireballTarget = ""
FunTab:AddTextbox({Title="Alvo da Bola de Fogo",Description="Nick do player",Default="",Placeholder="Digite nick...",Callback=function(value)
    fireballTarget = value
end})

FunTab:AddButton({Title="Bola de Fogo Fake",Description="Bola de fogo que mata e segue alvo",Callback=function()
    local char = player.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local ball = Instance.new("Part")
        ball.Shape = Enum.PartType.Ball
        ball.Size = Vector3.new(3,3,3)
        ball.Material = Enum.Material.Neon
        ball.BrickColor = BrickColor.new("Really red")
        ball.Position = hrp.Position + Vector3.new(0,3,0)
        ball.CanCollide = false
        ball.Parent = workspace

        local fire = Instance.new("Fire")
        fire.Heat = 15
        fire.Size = 10
        fire.Parent = ball

        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.new(0,0,0)
        bv.Parent = ball

        ball.Touched:Connect(function(hit)
            local h = hit.Parent:FindFirstChildOfClass("Humanoid")
            if h then h.Health = 0 end
        end)

        task.spawn(function()
            while ball and ball.Parent do
                if fireballTarget ~= "" then
                    local target = game.Players:FindFirstChild(fireballTarget)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local dir = (target.Character.HumanoidRootPart.Position - ball.Position).Unit
                        bv.Velocity = dir * 100
                    end
                else
                    bv.Velocity = hrp.CFrame.LookVector * 50
                end
                task.wait(0.1)
            end
        end)

        Debris:AddItem(ball,10)
    end
end})

-- Dança Infinita
FunTab:AddButton({Title="Dança Infinita",Description="Dança sem parar",Callback=function()
    loadstring(game:HttpGet("https://pastebin.com/raw/3bnjLJY2"))()
end})

-- Sentar
FunTab:AddButton({Title="Sentar em Qualquer Lugar",Description="Sentar onde quiser",Callback=function()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.Sit = true end
end})
