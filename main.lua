-- ==================== TELA DE CARREGAMENTO ====================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "IntroUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Fundo
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = gui

-- Texto central
local title = Instance.new("TextLabel")
title.Text = "Nexus Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.Position = UDim2.fromScale(0.5, 0.4)
title.Size = UDim2.fromScale(0.6, 0.2)
title.Parent = bg

-- Barra de carregamento (fundo)
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.5, 0, 0.03, 0)
barBG.Position = UDim2.fromScale(0.25, 0.65)
barBG.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
barBG.BorderSizePixel = 0
barBG.Parent = bg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBG

-- Função para criar quadrados partículas
local function createSquare()
    local sq = Instance.new("Frame")
    sq.Size = UDim2.fromOffset(math.random(30, 60), math.random(30, 60))
    sq.Position = UDim2.fromScale(math.random(), -0.1)
    sq.BackgroundTransparency = 1
    sq.AnchorPoint = Vector2.new(0.5, 0.5)
    sq.Parent = bg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.3, 0)
    corner.Parent = sq

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(255, 140, 0)
    stroke.Parent = sq

    -- movimento
    task.spawn(function()
        local rotation = math.random(-30, 30)
        local duration = math.random(4, 7)
        local goal = {
            Position = UDim2.fromScale(math.random(), 1.2),
            Rotation = rotation
        }
        local tween = TweenService:Create(sq, TweenInfo.new(duration, Enum.EasingStyle.Linear), goal)
        tween:Play()
        tween.Completed:Wait()
        sq:Destroy()
    end)
end

-- Spawner de partículas
task.spawn(function()
    while gui.Parent do
        createSquare()
        task.wait(0.2)
    end
end)

-- Animação da barra de carregamento
TweenService:Create(barFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- Som de intro
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9044739323"
sound.Volume = 1
sound.Looped = false
sound.Parent = gui
sound:Play()

-- Após 5s, fade out
task.delay(5, function()
    local fadeTween = TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1})
    fadeTween:Play()
    for _, obj in ipairs(bg:GetDescendants()) do
        if obj:IsA("TextLabel") then
            TweenService:Create(obj, TweenInfo.new(1), {TextTransparency = 1}):Play()
        elseif obj:IsA("Frame") then
            TweenService:Create(obj, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj, TweenInfo.new(1), {Transparency = 1}):Play()
        end
    end
    fadeTween.Completed:Wait()
    gui:Destroy()
end)

-- ==================== NEXUS HUB (REDZLIB) ====================

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
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
    Button = { 
        Image = "rbxassetid://93408381599498",
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromRGB(128,0,255)
    },
    Corner = { 
        CornerRadius = UDim.new(1,0)
    },
})

-- Função para criar tabs com ícones
local function MakeTabWithIcon(name, iconID)
    local tab = Window:MakeTab({name, ""})
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(0,25,0,25)
    img.Position = UDim2.new(0,10,0.5,-12)
    img.BackgroundTransparency = 1
    img.Image = iconID
    img.Parent = tab.Button
    return tab
end

-- ==================== CRIAR TABS ====================

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

MainTab:AddSection({ "Nexus hub em processo..." })
MainTab:AddParagraph({"Criadores", "By GhostFox"})
MainTab:AddParagraph({"Executor", "Delta"})
MainTab:AddDiscordInvite({
    Name = "Nexus Hub || Beta",
    Description = "Join server",
    Logo = "rbxassetid://93408381599498",
    Invite = "https://discord.gg/JK25f4kJSw",
})

-- ==================== FUN TAB ====================

-- Velocidade custom
FunTab:AddSlider({
    Title = "Velocidade",
    Description = "Muda sua velocidade de andar",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- Super Pulo
FunTab:AddSlider({
    Title = "Super Pulo",
    Description = "Aumenta a altura do pulo",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- Fly
FunTab:AddButton({
    Title = "Ativar Fly",
    Description = "Permite voar livremente",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YSL3xKYU"))()
    end
})

-- NoClip
FunTab:AddButton({
    Title = "Ativar NoClip",
    Description = "Atravessa paredes e objetos",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/6mrYTdQv"))()
    end
})

-- Mini Player
FunTab:AddButton({
    Title = "Virar Mini",
    Description = "Deixa seu personagem pequeno",
    Callback = function()
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Size = part.Size * 0.5
            end
        end
    end
})

-- Animações divertidas
FunTab:AddDropdown({
    Title = "Animações Extras",
    Description = "Escolha uma animação divertida",
    Values = {"Dab","Floss","Gangnam","Moonwalk","Cair Dramático"},
    Callback = function(anim)
        local Animate = Instance.new("Animation")
        if anim == "Dab" then
            Animate.AnimationId = "rbxassetid://248263260"
        elseif anim == "Floss" then
            Animate.AnimationId = "rbxassetid://5917459365"
        elseif anim == "Gangnam" then
            Animate.AnimationId = "rbxassetid://3189773368"
        elseif anim == "Moonwalk" then
            Animate.AnimationId = "rbxassetid://313762630"
        elseif anim == "Cair Dramático" then
            Animate.AnimationId = "rbxassetid://5319828216"
        end
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:LoadAnimation(Animate):Play()
        end
    end
})

-- Explosão fake
FunTab:AddButton({
    Title = "Explosão Fake",
    Description = "Cria uma explosão sem dano",
    Callback = function()
        local explosion = Instance.new("Explosion")
        explosion.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        explosion.BlastRadius = 10
        explosion.BlastPressure = 0
        explosion.Parent = workspace
    end
})

-- Bola de Fogo Fake
FunTab:AddButton({
    Title = "Bola de Fogo Fake",
    Description = "Joga uma bola de fogo divertida",
    Callback = function()
        local fireball = Instance.new("Part")
        fireball.Shape = Enum.PartType.Ball
        fireball.Size = Vector3.new(3,3,3)
        fireball.BrickColor = BrickColor.new("Really red")
        fireball.Material = Enum.Material.Neon
        fireball.Position = game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,2,0)
        fireball.Parent = workspace
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = game.Players.LocalPlayer.Character.Head.CFrame.LookVector * 100
        bv.Parent = fireball
        game.Debris:AddItem(fireball, 5)
    end
})

-- Dança Infinita
FunTab:AddButton({
    Title = "Dança Infinita",
    Description = "Fica dançando sem parar",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3bnjLJY2"))()
    end
})

-- Senta em qualquer lugar
FunTab:AddButton({
    Title = "Sentar em Qualquer Lugar",
    Description = "Seu personagem senta onde você quiser",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        humanoid.Sit = true
    end
})
