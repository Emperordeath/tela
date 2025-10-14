--[[
    Voidrake Hub - EXTREME VIP Loading + External Script
    Powered by: Deathbringer
    Features: Tela de carregamento épica (34s) + carregamento do script externo.
]]

-- ========== [ Tela de Carregamento EXTREME VIP (34s) ] ==========
local function createExtremeLoadingScreen()
    local loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "VoidrakeLoading"
    loadingGui.IgnoreGuiInset = true
    loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    loadingGui.Parent = game:GetService("CoreGui")

    -- Fundo (gradiente preto/roxo com pulso)
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BackgroundColor3 = Color3.fromRGB(10, 0, 20)
    background.BorderSizePixel = 0
    background.Parent = loadingGui

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 0, 80))
    }
    gradient.Rotation = 45
    gradient.Parent = background

    -- Efeito de pulso no fundo
    coroutine.wrap(function()
        while true do
            for i = 0, 1, 0.05 do
                background.BackgroundColor3 = Color3.fromRGB(10 + 5*i, 0, 20 + 10*i)
                task.wait(0.05)
            end
            for i = 1, 0, -0.05 do
                background.BackgroundColor3 = Color3.fromRGB(10 + 5*i, 0, 20 + 10*i)
                task.wait(0.05)
            end
        end
    end)()

    -- Logo "VOIDRAKE HUB" (GothamBlack + efeito dourado)
    local logo = Instance.new("TextLabel")
    logo.Name = "Logo"
    logo.Size = UDim2.new(0.6, 0, 0.2, 0)
    logo.Position = UDim2.new(0.5, 0, 0.3, 0)
    logo.AnchorPoint = Vector2.new(0.5, 0)
    logo.Text = "VOIDRAKE HUB"
    logo.TextColor3 = Color3.fromRGB(255, 215, 0) -- Dourado VIP
    logo.TextStrokeColor3 = Color3.fromRGB(200, 100, 255) -- Contorno roxo
    logo.TextStrokeTransparency = 0
    logo.TextSize = 50
    logo.Font = Enum.Font.GothamBlack
    logo.BackgroundTransparency = 1
    logo.TextScaled = true
    logo.Parent = background

    -- Efeito de brilho no logo
    coroutine.wrap(function()
        while true do
            logo.TextColor3 = Color3.fromRGB(255, 215 + math.sin(os.clock() * 2) * 40, 0)
            task.wait(0.05)
        end
    end)()

    -- Subtítulo "Powered by Deathbringer" (SciFi + efeito de digitação)
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(0.5, 0, 0.1, 0)
    subtitle.Position = UDim2.new(0.5, 0, 0.5, 0)
    subtitle.AnchorPoint = Vector2.new(0.5, 0)
    subtitle.Text = ""
    subtitle.TextColor3 = Color3.fromRGB(150, 100, 200)
    subtitle.TextStrokeTransparency = 0
    subtitle.TextSize = 24
    subtitle.Font = Enum.Font.SciFi
    subtitle.BackgroundTransparency = 1
    subtitle.Parent = background

    -- Efeito de digitação
    local fullText = "POWERED BY: DEATHBRINGER"
    coroutine.wrap(function()
        for i = 1, #fullText do
            subtitle.Text = string.sub(fullText, 1, i)
            task.wait(0.05)
        end
    end)()

    -- Texto "Carregando módulos" (Arcade + pontos animados)
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(0.4, 0, 0.05, 0)
    loadingText.Position = UDim2.new(0.5, 0, 0.6, 0)
    loadingText.AnchorPoint = Vector2.new(0.5, 0)
    loadingText.Text = "Carregando módulos"
    loadingText.TextColor3 = Color3.fromRGB(200, 200, 200)
    loadingText.TextStrokeTransparency = 0
    loadingText.TextSize = 20
    loadingText.Font = Enum.Font.Arcade
    loadingText.BackgroundTransparency = 1
    loadingText.Parent = background

    -- Animação de "..." (3 pontos)
    local dots = {"", ".", "..", "..."}
    local dotIndex = 1
    coroutine.wrap(function()
        while true do
            loadingText.Text = "Carregando módulos" .. dots[dotIndex]
            dotIndex = dotIndex % 4 + 1
            task.wait(0.3)
        end
    end)()

    -- Barra de progresso (34 segundos + porcentagem)
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Size = UDim2.new(0.5, 0, 0.04, 0)
    progressBar.Position = UDim2.new(0.5, 0, 0.7, 0)
    progressBar.AnchorPoint = Vector2.new(0.5, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = background

    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(255, 215, 0) -- Dourado VIP
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBar

    -- Texto de porcentagem
    local progressText = Instance.new("TextLabel")
    progressText.Name = "ProgressText"
    progressText.Size = UDim2.new(1, 0, 1, 0)
    progressText.Position = UDim2.new(0, 0, 0, 0)
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
    progressText.TextStrokeTransparency = 0
    progressText.TextSize = 16
    progressText.Font = Enum.Font.Arcade
    progressText.BackgroundTransparency = 1
    progressText.Parent = progressBar

    -- Animação da barra (34 segundos)
    local startTime = os.clock()
    local duration = 34 -- 34 segundos
    while os.clock() - startTime < duration do
        local progress = math.min((os.clock() - startTime) / duration, 1)
        progressFill.Size = UDim2.new(progress, 0, 1, 0)
        progressText.Text = string.format("%.1f%%", progress * 100)
        task.wait()
    end

    -- Mensagem final "Carregamento completo!"
    loadingText.Text = "Carregamento completo!"
    progressText.Text = "100%"

    -- Efeito de zoom + fade-out (transição VIP)
    for i = 1, 20 do
        logo.TextTransparency = i / 20
        subtitle.TextTransparency = i / 20
        loadingText.TextTransparency = i / 20
        progressBar.BackgroundTransparency = i / 20
        background.BackgroundTransparency = i / 40
        task.wait(0.05)
    end

    loadingGui:Destroy()

    -- Carregar script externo após a tela de loading
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Emperordeath/99/refs/heads/main/index.lua"))()
end

-- Iniciar tela de carregamento
createExtremeLoadingScreen()
