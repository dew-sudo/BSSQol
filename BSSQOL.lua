-- ═══════════════════════════════════════════════════════════════════════════
-- Bee Swarm Simulator - Inventory & Shop Viewer
-- ═══════════════════════════════════════════════════════════════════════════
-- Purpose: Read-only UI that displays player inventory and shop items
-- NOT a cheat | NOT automation | Does NOT modify gameplay
-- ═══════════════════════════════════════════════════════════════════════════

-- ═══════════════════════════════════════════════════════════════════════════
-- SHOP DATA TABLES
-- ═══════════════════════════════════════════════════════════════════════════
local SHOP_DATA = {
    Accessories = {
        -- HATS
        ["Strange Goggles"] = {Cost = 77, Slot = "Hat", Ingredients = {{"Micro-Converter", 1}, {"7ProngedCog", 7}}},
        ["Helmet"] = {Cost = 30000, Slot = "Hat", Ingredients = {{"Pineapple", 5}, {"MoonCharm", 1}}},
        ["Propeller Hat"] = {Cost = 2500000, Slot = "Hat", Ingredients = {{"Gumdrops", 25}, {"Pineapple", 100}, {"MoonCharm", 5}}},
        ["Beekeeper's Mask"] = {Cost = 20000000, Slot = "Hat", Ingredients = {{"Enzymes", 5}, {"Glue", 3}, {"Glitter", 1}}},
        ["Honey Mask"] = {Cost = 100000000, Slot = "Hat", Ingredients = {{"Treat", 9999}, {"Oil", 50}, {"Enzymes", 25}, {"Gold", 5}}},
        ["Fire Mask"] = {Cost = 100000000, Slot = "Hat", Ingredients = {{"Strawberry", 500}, {"RedExtract", 50}, {"Enzymes", 25}, {"Glue", 15}}},
        ["Bubble Mask"] = {Cost = 100000000, Slot = "Hat", Ingredients = {{"Blueberry", 500}, {"BlueExtract", 50}, {"Oil", 25}, {"Glitter", 15}}},
        ["Demon Mask"] = {Cost = 5000000000, Slot = "Hat", Ingredients = {{"Stinger", 500}, {"RedExtract", 250}, {"Enzymes", 150}, {"Glue", 100}, {"InvigoratingVial", 1}}},
        ["Diamond Mask"] = {Cost = 5000000000, Slot = "Hat", Ingredients = {{"BlueExtract", 250}, {"Oil", 150}, {"Glitter", 100}, {"Diamond", 5}, {"ComfortingVial", 1}}},
        ["Gummy Mask"] = {Cost = 5000000000, Slot = "Hat", Ingredients = {{"Glue", 250}, {"Enzymes", 100}, {"Oil", 100}, {"Glitter", 100}, {"SatisfyingVial", 1}}},
        
        -- SHOULDER GUARDS
        ["Brave Guard"] = {Cost = 300000, Slot = "Right Shoulder", Ingredients = {{"Stinger", 3}}},
        ["Hasty Guard"] = {Cost = 300000, Slot = "Right Shoulder", Ingredients = {{"MoonCharm", 5}}},
        ["Bomber Guard"] = {Cost = 300000, Slot = "Left Shoulder", Ingredients = {{"SunflowerSeed", 25}}},
        ["Looker Guard"] = {Cost = 300000, Slot = "Left Shoulder", Ingredients = {{"SunflowerSeed", 25}}},
        ["Blue Guard"] = {Cost = 1000000, Slot = "Right Shoulder", Ingredients = {{"Blueberry", 50}, {"RoyalJelly", 1}, {"MoonCharm", 3}}},
        ["Elite Blue Guard"] = {Cost = 5000000, Slot = "Right Shoulder", Ingredients = {{"BlueExtract", 3}, {"Blueberry", 50}, {"RoyalJelly", 5}, {"MoonCharm", 15}}},
        ["Bucko Guard"] = {Cost = 30000000, Slot = "Right Shoulder", Ingredients = {{"BlueExtract", 10}, {"Blueberry", 100}, {"Glue", 5}, {"MoonCharm", 75}}},
        ["Cobalt Guard"] = {Cost = 200000000, Slot = "Right Shoulder", Ingredients = {{"BlueExtract", 100}, {"Stinger", 100}, {"Enzymes", 50}, {"Glitter", 25}}},
        ["Red Guard"] = {Cost = 750000, Slot = "Left Shoulder", Ingredients = {{"Strawberry", 50}, {"RoyalJelly", 1}, {"Stinger", 1}}},
        ["Elite Red Guard"] = {Cost = 5000000, Slot = "Left Shoulder", Ingredients = {{"RedExtract", 3}, {"Strawberry", 50}, {"RoyalJelly", 5}, {"Stinger", 5}}},
        ["Riley Guard"] = {Cost = 30000000, Slot = "Left Shoulder", Ingredients = {{"RedExtract", 10}, {"Strawberry", 100}, {"Glue", 5}, {"Stinger", 25}}},
        ["Crimson Guard"] = {Cost = 200000000, Slot = "Left Shoulder", Ingredients = {{"RedExtract", 100}, {"Stinger", 100}, {"Oil", 50}, {"Glitter", 25}}},
        
        -- BELTS
        ["Belt Pocket"] = {Cost = 14000, Slot = "Belt", Ingredients = {{"SunflowerSeed", 10}}},
        ["Belt Bag"] = {Cost = 440000, Slot = "Belt", Ingredients = {{"Pineapple", 50}, {"SunflowerSeed", 50}, {"Stinger", 3}}},
        ["Mondo Belt Bag"] = {Cost = 12400000, Slot = "Belt", Ingredients = {{"SoftWax", 1}, {"Pineapple", 150}, {"SunflowerSeed", 150}, {"Stinger", 10}}},
        ["Honeycomb Belt"] = {Cost = 75000000, Slot = "Belt", Ingredients = {{"Enzymes", 50}, {"Glue", 50}, {"Oil", 25}}},
        ["Petal Belt"] = {Cost = 15000000000, Slot = "Belt", Ingredients = {{"SpiritPetal", 1}, {"StarJelly", 25}, {"Glitter", 50}, {"Glue", 100}}},
        ["Coconut Belt"] = {Cost = 7500000000000, Slot = "Belt", Ingredients = {{"Coconut", 500}, {"TropicalDrink", 1500}, {"PurplePotion", 200}, {"HardWax", 200}, {"RefreshingVial", 3}, {"Turpentine", 3}}},
        
        -- BOOTS
        ["Basic Boots"] = {Cost = 4400, Slot = "Boots", Ingredients = {{"SunflowerSeed", 3}, {"Blueberry", 3}}},
        ["Hiking Boots"] = {Cost = 2200000, Slot = "Boots", Ingredients = {{"Blueberry", 50}, {"Strawberry", 50}}},
        ["Beekeeper's Boots"] = {Cost = 15000000, Slot = "Boots", Ingredients = {{"Oil", 5}, {"BlueExtract", 3}, {"RedExtract", 3}}},
        ["Coconut Clogs"] = {Cost = 10000000000, Slot = "Boots", Ingredients = {{"Coconut", 150}, {"TropicalDrink", 50}, {"Glue", 100}, {"Oil", 100}, {"RefreshingVial", 1}}},
        ["Gummy Boots"] = {Cost = 100000000000, Slot = "Boots", Ingredients = {{"Glue", 500}, {"RedExtract", 250}, {"BlueExtract", 250}, {"Glitter", 250}, {"SatisfyingVial", 1}, {"MotivatingVial", 1}}},
    },
    
    Containers = {
        ["Pouch"] = {Cost = 0, Capacity = 200},
        ["Jar"] = {Cost = 650, Capacity = 750},
        ["Backpack"] = {Cost = 5500, Capacity = 3500},
        ["Canister"] = {Cost = 22000, Capacity = 10000},
        ["Mega-Jug"] = {Cost = 50000, Capacity = 25000},
        ["Compressor"] = {Cost = 160000, Capacity = 50000},
        ["Elite Barrel"] = {Cost = 650000, Capacity = 125000},
        ["Port-O-Hive"] = {Cost = 1250000, Capacity = 250000},
        ["Red Port-O-Hive"] = {Cost = 12500000, Capacity = 400000, Ingredients = {{"RedExtract", 2}, {"SoftWax", 2}}},
        ["Blue Port-O-Hive"] = {Cost = 12500000, Capacity = 400000, Ingredients = {{"BlueExtract", 2}, {"SoftWax", 2}}},
        ["Porcelain Port-O-Hive"] = {Cost = 250000000, Capacity = 600000, Ingredients = {{"Glitter", 3}, {"SoftWax", 3}, {"MoonCharm", 10}}},
        ["Coconut Canister"] = {Cost = 25000000000, Capacity = 1000000, Ingredients = {{"Coconut", 250}, {"TropicalDrink", 150}, {"RedExtract", 150}, {"BlueExtract", 150}, {"RefreshingVial", 2}}},
    },
    
    Collectors = {
        ["Scooper"] = {Cost = 0, Cooldown = 0.8},
        ["Rake"] = {Cost = 800, Cooldown = 0.7},
        ["Clippers"] = {Cost = 2200, Cooldown = 0.6},
        ["Magnet"] = {Cost = 5500, Cooldown = 0.8},
        ["Vacuum"] = {Cost = 14000, Cooldown = 0.8},
        ["Super-Scooper"] = {Cost = 40000, Cooldown = 0.5},
        ["Pulsar"] = {Cost = 125000, Cooldown = 1},
        ["Electro-Magnet"] = {Cost = 300000, Cooldown = 0.5},
        ["Scissors"] = {Cost = 850000, Cooldown = 0.5},
        ["Honey Dipper"] = {Cost = 1500000, Cooldown = 0.9},
        ["Scythe"] = {Cost = 3500000, Cooldown = 0.47},
        ["Bubble Wand"] = {Cost = 3500000, Cooldown = 0.75},
        ["Sticker-Seeker"] = {Cost = 7000000, Cooldown = 1, Ingredients = {{"Glue", 1}, {"Oil", 1}, {"SoftWax", 5}, {"Neonberry", 5}, {"Micro-Converter", 10}}},
        ["Golden Rake"] = {Cost = 20000000, Cooldown = 0.6},
        ["Spark Staff"] = {Cost = 60000000, Cooldown = 0.5},
        ["Porcelain Dipper"] = {Cost = 150000000, Cooldown = 0.7},
        ["Petal Wand"] = {Cost = 1500000000, Cooldown = 0.7, Ingredients = {{"SpiritPetal", 1}, {"StarJelly", 10}, {"Glitter", 25}, {"Enzymes", 75}}},
        ["Gummyballer"] = {Cost = 10000000000000, Cooldown = 1, Ingredients = {{"Glue", 1500}, {"Gumdrops", 2000}, {"CausticWax", 50}, {"SuperSmoothie", 50}, {"Turpentine", 5}, {"SatisfyingVial", 3}}},
        ["Dark Scythe"] = {Cost = 2500000000000, Cooldown = 0.47, Ingredients = {{"RedExtract", 1500}, {"Stinger", 150}, {"HardWax", 100}, {"CausticWax", 50}, {"SuperSmoothie", 50}, {"InvigoratingVial", 3}}},
        ["Tide Popper"] = {Cost = 2500000000000, Cooldown = 1, Ingredients = {{"BlueExtract", 1500}, {"Stinger", 150}, {"TropicalDrink", 150}, {"SwirledWax", 75}, {"SuperSmoothie", 50}, {"ComfortingVial", 3}}},
    }
}

-- ═══════════════════════════════════════════════════════════════════════════
-- SERVICES & REFERENCES
-- ═══════════════════════════════════════════════════════════════════════════
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

-- ═══════════════════════════════════════════════════════════════════════════
-- CONFIGURATION
-- ═══════════════════════════════════════════════════════════════════════════
local CONFIG = {
    TOGGLE_KEY = Enum.KeyCode.L,
    WINDOW = {
        WIDTH = 450,
        HEIGHT = 500,
        TITLE_HEIGHT = 24,
        TAB_HEIGHT = 30,
        BUTTON_SIZE = 24,
        ROW_HEIGHT = 40,
        ICON_SIZE = 32,
        COLUMN_WIDTH = 145,
        COLUMN_PADDING = 3,
        SCROLLBAR_THICKNESS = 6
    },
    COLORS = {
        BACKGROUND = Color3.new(0, 0, 0),
        TEXT = Color3.new(1, 1, 1),
        TRANSPARENCY = 0.5,
        TAB_ACTIVE = Color3.new(0.3, 0.6, 1),
        TAB_INACTIVE = Color3.new(0.2, 0.2, 0.2),
        AFFORDABLE = Color3.new(0.2, 1, 0.2),
        UNAFFORDABLE = Color3.new(1, 0.3, 0.3)
    }
}

-- ═══════════════════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════════════════

-- Check if player owns this item (filtering logic)
local function shouldShowItem(countText)
    if not countText then return false end
    
    -- Remove any whitespace
    countText = countText:gsub("%s+", "")
    
    -- Hide if count is "x0" or "0"
    if countText == "x0" or countText == "0" then
        return false
    end
    
    -- Hide planters (format: "0/100", "0/50", etc)
    if countText:match("^0/") then
        return false
    end
    
    return true
end

-- Extract numeric count from text for future sorting
local function extractCount(countText)
    local num = countText:match("x(%d+)")
    if num then
        return tonumber(num)
    end
    
    -- For planter format "25/100"
    local current, max = countText:match("(%d+)/(%d+)")
    if current then
        return tonumber(current)
    end
    
    return 0
end

-- Format large numbers with K, M, B, T abbreviations
local function formatNumber(num)
    if num >= 1000000000000 then
        return string.format("%.1fT", num / 1000000000000)
    elseif num >= 1000000000 then
        return string.format("%.1fB", num / 1000000000)
    elseif num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

-- Ingredient icon asset IDs (Bee Swarm Simulator icons)
local INGREDIENT_ICONS = {
    ["Micro-Converter"] = "rbxassetid://3124514845",
    ["7ProngedCog"] = "rbxassetid://3124512354",
    ["Pineapple"] = "rbxassetid://4555718534",
    ["MoonCharm"] = "rbxassetid://1623283648",
    ["Gumdrops"] = "rbxassetid://1096879572",
    ["Enzymes"] = "rbxassetid://4155146243",
    ["Glue"] = "rbxassetid://4658013822",
    ["Glitter"] = "rbxassetid://4658015542",
    ["Treat"] = "rbxassetid://177789379",
    ["Oil"] = "rbxassetid://4771334905",
    ["Gold"] = "rbxassetid://1223680925",
    ["Strawberry"] = "rbxassetid://4464568893",
    ["RedExtract"] = "rbxassetid://4658011257",
    ["Blueberry"] = "rbxassetid://4464568893",
    ["BlueExtract"] = "rbxassetid://4658009698",
    ["Stinger"] = "rbxassetid://4290180335",
    ["InvigoratingVial"] = "rbxassetid://4871846094",
    ["Diamond"] = "rbxassetid://1235293542",
    ["ComfortingVial"] = "rbxassetid://4871841404",
    ["SatisfyingVial"] = "rbxassetid://4871848477",
    ["RoyalJelly"] = "rbxassetid://1087085872",
    ["SunflowerSeed"] = "rbxassetid://4304133846",
    ["SoftWax"] = "rbxassetid://4563095195",
    ["SpiritPetal"] = "rbxassetid://4771331661",
    ["StarJelly"] = "rbxassetid://4563095195",
    ["Coconut"] = "rbxassetid://4555718534",
    ["TropicalDrink"] = "rbxassetid://4555718534",
    ["PurplePotion"] = "rbxassetid://4555718534",
    ["HardWax"] = "rbxassetid://4563095195",
    ["RefreshingVial"] = "rbxassetid://4871846094",
    ["Turpentine"] = "rbxassetid://4555718534",
    ["Neonberry"] = "rbxassetid://4555718534",
    ["GummyBoots"] = "rbxassetid://4555718534",
    ["CausticWax"] = "rbxassetid://4563095195",
    ["SuperSmoothie"] = "rbxassetid://4555718534",
    ["SwirledWax"] = "rbxassetid://4563095195",
    ["MotivatingVial"] = "rbxassetid://4871846094",
    ["HoneyDipper"] = "rbxassetid://4555718534",
    ["PorcelainDipper"] = "rbxassetid://4555718534",
    ["PetalWand"] = "rbxassetid://4555718534",
    ["Gummyballer"] = "rbxassetid://4555718534",
    ["DarkScythe"] = "rbxassetid://4555718534",
    ["TidePopper"] = "rbxassetid://4555718534",
    ["GoldenRake"] = "rbxassetid://4555718534",
    ["SparkStaff"] = "rbxassetid://4555718534",
    ["StickerSeeker"] = "rbxassetid://4555718534",
    ["Scythe"] = "rbxassetid://4555718534",
    ["BubbleWand"] = "rbxassetid://4555718534",
    ["Vacuum"] = "rbxassetid://4555718534",
    ["Magnet"] = "rbxassetid://4555718534",
    ["Clippers"] = "rbxassetid://4555718534",
    ["Rake"] = "rbxassetid://4555718534",
    ["SuperScooper"] = "rbxassetid://4555718534",
    ["Pulsar"] = "rbxassetid://4555718534",
    ["ElectroMagnet"] = "rbxassetid://4555718534",
    ["Scissors"] = "rbxassetid://4555718534",
}

-- Cache player's inventory items
local playerInventory = {}

local function UpdatePlayerInventory()
    playerInventory = {}
    
    local eggRows = InventoryReader.GetEggRows()
    if not eggRows then return end
    
    for _, row in ipairs(eggRows:GetChildren()) do
        local slot = row:FindFirstChild("EggSlot")
        if not slot then return nil end
        
        local icon = slot:FindFirstChild("EggIcon")
        local count = slot:FindFirstChild("Count")
        
        if icon and count then
            local countText = count.Text:gsub("%s+", "")
            local countNum = tonumber(countText:match("x(%d+)")) or tonumber(countText) or 0
            
            if countNum > 0 then
                -- Store by icon asset ID for quick lookup
                playerInventory[icon.Image] = countNum
            end
        end
    end
end

-- Check if player has a specific ingredient
local function PlayerHasIngredient(ingredientName)
    -- Update inventory cache
    UpdatePlayerInventory()
    
    -- Check by icon
    local iconId = INGREDIENT_ICONS[ingredientName]
    if iconId and playerInventory[iconId] then
        return true, playerInventory[iconId]
    end
    
    return false, 0
end

-- Format ingredient list for display (legacy function for compatibility)
local function formatIngredients(ingredients)
    if not ingredients or #ingredients == 0 then
        return "None"
    end
    
    local parts = {}
    for _, ing in ipairs(ingredients) do
        local name = ing[1]:gsub("([A-Z])", " %1"):sub(2) -- Add spaces before capitals
        table.insert(parts, ing[2] .. "x " .. name)
    end
    
    return table.concat(parts, ", ")
end

-- ═══════════════════════════════════════════════════════════════════════════
-- UI CREATION MODULE
-- ═══════════════════════════════════════════════════════════════════════════
local UI = {}

function UI.CreateMainFrame()
    local gui = Instance.new("ScreenGui")
    gui.Parent = pgui
    gui.ResetOnSpawn = false
    gui.Name = "BS_InventoryViewer"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Name = "MainFrame"
    frame.BackgroundColor3 = CONFIG.COLORS.BACKGROUND
    frame.BackgroundTransparency = CONFIG.COLORS.TRANSPARENCY
    frame.Size = UDim2.new(0, CONFIG.WINDOW.WIDTH, 0, CONFIG.WINDOW.HEIGHT)
    frame.Position = UDim2.new(0.5, -CONFIG.WINDOW.WIDTH/2, 0.5, -CONFIG.WINDOW.HEIGHT/2)
    frame.Active = true
    frame.Draggable = true
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
    
    return gui, frame
end

function UI.CreateTitleBar(parent)
    local title = Instance.new("TextLabel")
    title.Parent = parent
    title.Name = "TitleBar"
    title.Size = UDim2.new(1, 0, 0, CONFIG.WINDOW.TITLE_HEIGHT)
    title.BackgroundTransparency = 1
    title.TextColor3 = CONFIG.COLORS.TEXT
    title.Text = "🐝 Inventory & Shop"
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextXAlignment = Enum.TextXAlignment.Center
    
    return title
end

function UI.CreateTabBar(parent)
    local tabBar = Instance.new("Frame")
    tabBar.Parent = parent
    tabBar.Name = "TabBar"
    tabBar.Size = UDim2.new(1, 0, 0, CONFIG.WINDOW.TAB_HEIGHT)
    tabBar.Position = UDim2.new(0, 0, 0, CONFIG.WINDOW.TITLE_HEIGHT)
    tabBar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    tabBar.BorderSizePixel = 0
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = tabBar
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 2)
    
    return tabBar
end

function UI.CreateTab(parent, text, layoutOrder)
    local tab = Instance.new("TextButton")
    tab.Parent = parent
    tab.Name = text
    tab.Size = UDim2.new(0.25, -2, 1, 0)
    tab.BackgroundColor3 = CONFIG.COLORS.TAB_INACTIVE
    tab.TextColor3 = CONFIG.COLORS.TEXT
    tab.Text = text
    tab.Font = Enum.Font.SourceSansBold
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    tab.LayoutOrder = layoutOrder
    
    return tab
end

function UI.CreateButton(parent, text, position)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(0, CONFIG.WINDOW.BUTTON_SIZE, 0, CONFIG.WINDOW.BUTTON_SIZE)
    btn.Position = position
    btn.BackgroundTransparency = 1
    btn.TextColor3 = CONFIG.COLORS.TEXT
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    
    -- Hover effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.7
        btn.BackgroundColor3 = Color3.new(1, 1, 1)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 1
    end)
    
    return btn
end

function UI.CreateScrollingFrame(parent)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = parent
    scroll.Name = "ItemList"
    scroll.BackgroundTransparency = 1
    scroll.Position = UDim2.new(0, 0, 0, CONFIG.WINDOW.TITLE_HEIGHT + CONFIG.WINDOW.TAB_HEIGHT + 4)
    scroll.Size = UDim2.new(1, 0, 1, -(CONFIG.WINDOW.TITLE_HEIGHT + CONFIG.WINDOW.TAB_HEIGHT + 4))
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = CONFIG.WINDOW.SCROLLBAR_THICKNESS
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    scroll.BorderSizePixel = 0
    
    -- Use UIGridLayout for 3 columns
    local grid = Instance.new("UIGridLayout")
    grid.Parent = scroll
    grid.CellSize = UDim2.new(0, CONFIG.WINDOW.COLUMN_WIDTH, 0, CONFIG.WINDOW.ROW_HEIGHT)
    grid.CellPadding = UDim2.new(0, CONFIG.WINDOW.COLUMN_PADDING, 0, CONFIG.WINDOW.COLUMN_PADDING)
    grid.FillDirection = Enum.FillDirection.Horizontal
    grid.HorizontalAlignment = Enum.HorizontalAlignment.Left
    grid.VerticalAlignment = Enum.VerticalAlignment.Top
    grid.SortOrder = Enum.SortOrder.LayoutOrder
    
    return scroll, grid
end

function UI.CreateItemCell(parent, iconId, countObj)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.Name = "ItemCell"
    container.Size = UDim2.new(0, CONFIG.WINDOW.COLUMN_WIDTH, 0, CONFIG.WINDOW.ROW_HEIGHT)
    container.BackgroundTransparency = 1
    
    -- Icon on the left
    local icon = Instance.new("ImageLabel")
    icon.Parent = container
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, CONFIG.WINDOW.ICON_SIZE, 0, CONFIG.WINDOW.ICON_SIZE)
    icon.Position = UDim2.new(0, 4, 0.5, -CONFIG.WINDOW.ICON_SIZE/2)
    icon.BackgroundTransparency = 1
    icon.Image = iconId
    icon.ScaleType = Enum.ScaleType.Fit
    
    -- Count text on the right
    local text = Instance.new("TextLabel")
    text.Parent = container
    text.Name = "CountText"
    text.Size = UDim2.new(1, -(CONFIG.WINDOW.ICON_SIZE + 8), 1, 0)
    text.Position = UDim2.new(0, CONFIG.WINDOW.ICON_SIZE + 8, 0, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = CONFIG.COLORS.TEXT
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 14
    text.Text = countObj.Text
    text.TextStrokeTransparency = 0.5
    text.TextStrokeColor3 = Color3.new(0, 0, 0)
    
    return container, text
end

function UI.CreateShopItemCell(parent, itemName, itemData, categoryName)
    local container = Instance.new("TextButton")
    container.Parent = parent
    container.Name = itemName
    container.Size = UDim2.new(0, CONFIG.WINDOW.COLUMN_WIDTH, 0, CONFIG.WINDOW.ROW_HEIGHT)
    container.BackgroundTransparency = 0.9
    container.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    container.BorderSizePixel = 1
    container.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    container.AutoButtonColor = true
    container.Text = ""
    
    -- Item name at top
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = container
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, -8, 0, 16)
    nameLabel.Position = UDim2.new(0, 4, 0, 2)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = CONFIG.COLORS.TEXT
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextSize = 12
    nameLabel.Text = itemName
    nameLabel.TextScaled = false
    nameLabel.TextWrapped = false
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    
    -- Price at bottom
    local priceLabel = Instance.new("TextLabel")
    priceLabel.Parent = container
    priceLabel.Name = "PriceLabel"
    priceLabel.Size = UDim2.new(1, -8, 0, 18)
    priceLabel.Position = UDim2.new(0, 4, 1, -20)
    priceLabel.BackgroundTransparency = 1
    priceLabel.TextColor3 = Color3.new(1, 0.9, 0.2)
    priceLabel.TextXAlignment = Enum.TextXAlignment.Left
    priceLabel.Font = Enum.Font.SourceSansBold
    priceLabel.TextSize = 11
    priceLabel.Text = "💰 " .. formatNumber(itemData.Cost)
    priceLabel.TextStrokeTransparency = 0.5
    priceLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    
    -- Store item data for detail panel
    container:SetAttribute("ItemName", itemName)
    container:SetAttribute("Category", categoryName)
    
    return container
end

-- ═══════════════════════════════════════════════════════════════════════════
-- INVENTORY READER MODULE
-- ═══════════════════════════════════════════════════════════════════════════
local InventoryReader = {}

function InventoryReader.GetEggRows()
    local success, result = pcall(function()
        return pgui.ScreenGui.Menus.Children.Eggs.Content.EggRows
    end)
    
    if success then
        return result
    else
        warn("[BS Inventory Viewer] Could not find EggRows: " .. tostring(result))
        return nil
    end
end

function InventoryReader.ParseItem(row)
    local slot = row:FindFirstChild("EggSlot")
    if not slot then return nil end
    
    local icon = slot:FindFirstChild("EggIcon")
    local count = slot:FindFirstChild("Count")
    
    if not icon or not count then return nil end
    
    return {
        iconId = icon.Image,
        countObj = count,
        countText = count.Text
    }
end

-- ═══════════════════════════════════════════════════════════════════════════
-- MAIN APPLICATION
-- ═══════════════════════════════════════════════════════════════════════════
local App = {}
App.gui = nil
App.frame = nil
App.listFrame = nil
App.tabBar = nil
App.tabs = {}
App.currentTab = "Inventory"
App.minimized = false
App.visible = true
App.itemCells = {}
App.detailPanel = nil

function App:Initialize()
    print("[BS Inventory Viewer] Initializing...")
    
    -- Create UI
    self.gui, self.frame = UI.CreateMainFrame()
    UI.CreateTitleBar(self.frame)
    
    -- Create tab bar
    self.tabBar = UI.CreateTabBar(self.frame)
    
    -- Create tabs
    self.tabs.Inventory = UI.CreateTab(self.tabBar, "Inventory", 1)
    self.tabs.Accessories = UI.CreateTab(self.tabBar, "Accessories", 2)
    self.tabs.Containers = UI.CreateTab(self.tabBar, "Containers", 3)
    self.tabs.Collectors = UI.CreateTab(self.tabBar, "Collectors", 4)
    
    -- Set initial active tab
    self.tabs.Inventory.BackgroundColor3 = CONFIG.COLORS.TAB_ACTIVE
    
    -- Create buttons
    local minimizeBtn = UI.CreateButton(
        self.frame, 
        "_", 
        UDim2.new(1, -(CONFIG.WINDOW.BUTTON_SIZE * 2), 0, 0)
    )
    
    local closeBtn = UI.CreateButton(
        self.frame, 
        "X", 
        UDim2.new(1, -CONFIG.WINDOW.BUTTON_SIZE, 0, 0)
    )
    
    -- Create scrolling list
    self.listFrame, self.grid = UI.CreateScrollingFrame(self.frame)
    
    -- Connect buttons
    minimizeBtn.MouseButton1Click:Connect(function() self:ToggleMinimize() end)
    closeBtn.MouseButton1Click:Connect(function() self:Close() end)
    
    -- Connect tabs
    for tabName, tab in pairs(self.tabs) do
        tab.MouseButton1Click:Connect(function() self:SwitchTab(tabName) end)
    end
    
    -- Load initial content (inventory)
    self:LoadInventory()
    
    -- Setup keybind
    self:SetupKeybind()
    
    print("[BS Inventory Viewer] Ready! Press L to toggle.")
end

function App:SwitchTab(tabName)
    if self.currentTab == tabName then return end
    
    -- Update tab colors
    for name, tab in pairs(self.tabs) do
        if name == tabName then
            tab.BackgroundColor3 = CONFIG.COLORS.TAB_ACTIVE
        else
            tab.BackgroundColor3 = CONFIG.COLORS.TAB_INACTIVE
        end
    end
    
    self.currentTab = tabName
    
    -- Clear current content
    self:ClearList()
    
    -- Load new content
    if tabName == "Inventory" then
        self:LoadInventory()
    elseif tabName == "Accessories" then
        self:LoadShopCategory("Accessories")
    elseif tabName == "Containers" then
        self:LoadShopCategory("Containers")
    elseif tabName == "Collectors" then
        self:LoadShopCategory("Collectors")
    end
end

function App:ClearList()
    for _, child in ipairs(self.listFrame:GetChildren()) do
        if child:IsA("GuiObject") and child.Name ~= "UIGridLayout" then
            child:Destroy()
        end
    end
    self.itemCells = {}
end

function App:LoadShopCategory(categoryName)
    local categoryData = SHOP_DATA[categoryName]
    if not categoryData then
        warn("[BS Inventory Viewer] Unknown category: " .. categoryName)
        return
    end
    
    local itemCount = 0
    
    -- Sort items by cost
    local sortedItems = {}
    for itemName, itemData in pairs(categoryData) do
        table.insert(sortedItems, {name = itemName, data = itemData})
    end
    
    table.sort(sortedItems, function(a, b)
        return a.data.Cost < b.data.Cost
    end)
    
    -- Create shop item cells
    for _, item in ipairs(sortedItems) do
        local cell = UI.CreateShopItemCell(self.listFrame, item.name, item.data, categoryName)
        
        -- Connect click to show details
        cell.MouseButton1Click:Connect(function()
            self:ShowItemDetails(item.name, item.data, categoryName)
        end)
        
        itemCount = itemCount + 1
    end
    
    print(string.format("[BS Inventory Viewer] Loaded %d %s items", itemCount, categoryName))
end

function App:ShowItemDetails(itemName, itemData, categoryName)
    -- Close existing detail panel if any
    if self.detailPanel then
        self.detailPanel:Destroy()
    end
    
    -- Create detail panel
    local panel = Instance.new("Frame")
    panel.Parent = self.gui
    panel.Name = "DetailPanel"
    panel.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
    panel.BackgroundTransparency = 0.1
    panel.Size = UDim2.new(0, 300, 0, 250)
    panel.Position = UDim2.new(0.5, -150, 0.5, -125)
    panel.BorderSizePixel = 2
    panel.BorderColor3 = Color3.new(0.3, 0.6, 1)
    panel.ZIndex = 10
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Parent = panel
    title.Size = UDim2.new(1, -10, 0, 24)
    title.Position = UDim2.new(0, 5, 0, 5)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.Text = itemName
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 11
    
    -- Cost
    local costLabel = Instance.new("TextLabel")
    costLabel.Parent = panel
    costLabel.Size = UDim2.new(1, -10, 0, 20)
    costLabel.Position = UDim2.new(0, 5, 0, 35)
    costLabel.BackgroundTransparency = 1
    costLabel.TextColor3 = Color3.new(1, 0.9, 0.2)
    costLabel.Font = Enum.Font.SourceSansBold
    costLabel.TextSize = 16
    costLabel.Text = "💰 Cost: " .. formatNumber(itemData.Cost) .. " Honey"
    costLabel.TextXAlignment = Enum.TextXAlignment.Left
    costLabel.ZIndex = 11
    
    -- Additional stats
    local yOffset = 60
    
    if itemData.Capacity then
        local capLabel = Instance.new("TextLabel")
        capLabel.Parent = panel
        capLabel.Size = UDim2.new(1, -10, 0, 18)
        capLabel.Position = UDim2.new(0, 5, 0, yOffset)
        capLabel.BackgroundTransparency = 1
        capLabel.TextColor3 = Color3.new(0.8, 0.8, 1)
        capLabel.Font = Enum.Font.SourceSans
        capLabel.TextSize = 14
        capLabel.Text = "📦 Capacity: " .. formatNumber(itemData.Capacity)
        capLabel.TextXAlignment = Enum.TextXAlignment.Left
        capLabel.ZIndex = 11
        yOffset = yOffset + 20
    end
    
    if itemData.Cooldown then
        local cdLabel = Instance.new("TextLabel")
        cdLabel.Parent = panel
        cdLabel.Size = UDim2.new(1, -10, 0, 18)
        cdLabel.Position = UDim2.new(0, 5, 0, yOffset)
        cdLabel.BackgroundTransparency = 1
        cdLabel.TextColor3 = Color3.new(0.8, 1, 0.8)
        cdLabel.Font = Enum.Font.SourceSans
        cdLabel.TextSize = 14
        cdLabel.Text = "⏱️ Cooldown: " .. itemData.Cooldown .. "s"
        cdLabel.TextXAlignment = Enum.TextXAlignment.Left
        cdLabel.ZIndex = 11
        yOffset = yOffset + 20
    end
    
    if itemData.Slot then
        local slotLabel = Instance.new("TextLabel")
        slotLabel.Parent = panel
        slotLabel.Size = UDim2.new(1, -10, 0, 18)
        slotLabel.Position = UDim2.new(0, 5, 0, yOffset)
        slotLabel.BackgroundTransparency = 1
        slotLabel.TextColor3 = Color3.new(1, 0.8, 0.6)
        slotLabel.Font = Enum.Font.SourceSans
        slotLabel.TextSize = 14
        slotLabel.Text = "📍 Slot: " .. itemData.Slot
        slotLabel.TextXAlignment = Enum.TextXAlignment.Left
        slotLabel.ZIndex = 11
        yOffset = yOffset + 20
    end
    
    -- Ingredients
    if itemData.Ingredients and #itemData.Ingredients > 0 then
        local ingTitle = Instance.new("TextLabel")
        ingTitle.Parent = panel
        ingTitle.Size = UDim2.new(1, -10, 0, 18)
        ingTitle.Position = UDim2.new(0, 5, 0, yOffset)
        ingTitle.BackgroundTransparency = 1
        ingTitle.TextColor3 = Color3.new(1, 0.7, 0.3)
        ingTitle.Font = Enum.Font.SourceSansBold
        ingTitle.TextSize = 14
        ingTitle.Text = "🔧 Ingredients:"
        ingTitle.TextXAlignment = Enum.TextXAlignment.Left
        ingTitle.ZIndex = 11
        yOffset = yOffset + 20
        
        local ingText = Instance.new("TextLabel")
        ingText.Parent = panel
        ingText.Size = UDim2.new(1, -15, 0, 60)
        ingText.Position = UDim2.new(0, 10, 0, yOffset)
        ingText.BackgroundTransparency = 1
        ingText.TextColor3 = Color3.new(0.9, 0.9, 0.9)
        ingText.Font = Enum.Font.SourceSans
        ingText.TextSize = 12
        ingText.Text = formatIngredients(itemData.Ingredients)
        ingText.TextXAlignment = Enum.TextXAlignment.Left
        ingText.TextYAlignment = Enum.TextYAlignment.Top
        ingText.TextWrapped = true
        ingText.ZIndex = 11

        
    end
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Parent = panel
    closeBtn.Size = UDim2.new(0, 24, 0, 24)
    closeBtn.Position = UDim2.new(1, -29, 0, 5)
    closeBtn.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.SourceSansBold
    closeBtn.TextSize = 16
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.ZIndex = 11
    
    closeBtn.MouseButton1Click:Connect(function()
        panel:Destroy()
        self.detailPanel = nil
    end)
    
    self.detailPanel = panel
end

function App:LoadInventory()
    local eggRows = InventoryReader.GetEggRows()
    if not eggRows then
        warn("[BS Inventory Viewer] Could not load inventory")
        return
    end
    
    local itemCount = 0
    
    for _, row in ipairs(eggRows:GetChildren()) do
        local item = InventoryReader.ParseItem(row)
        
        if item and shouldShowItem(item.countText) then
            self:AddItem(item.iconId, item.countObj)
            itemCount = itemCount + 1
        end
    end
    
    print(string.format("[BS Inventory Viewer] Loaded %d items", itemCount))
end

function App:AddItem(iconId, countObj)
    local cell, textLabel = UI.CreateItemCell(self.listFrame, iconId, countObj)
    
    -- Store reference for potential future features
    table.insert(self.itemCells, {
        cell = cell,
        textLabel = textLabel,
        countObj = countObj
    })
    
    -- Live update connection
    countObj:GetPropertyChangedSignal("Text"):Connect(function()
        textLabel.Text = countObj.Text
        
        -- Hide item if count drops to 0
        if not shouldShowItem(countObj.Text) then
            cell.Visible = false
        else
            cell.Visible = true
        end
    end)
end

function App:ToggleMinimize()
    self.minimized = not self.minimized
    self.listFrame.Visible = not self.minimized
    
    -- Update button text
    local btn = self.frame:FindFirstChild("TitleBar").Parent:GetChildren()
    for _, child in ipairs(self.frame:GetChildren()) do
        if child:IsA("TextButton") and child.Text == "_" then
            child.Text = self.minimized and "+" or "_"
            break
        elseif child:IsA("TextButton") and child.Text == "+" then
            child.Text = self.minimized and "+" or "_"
            break
        end
    end
end

function App:SetupKeybind()
    UIS.InputBegan:Connect(function(input, processed)
        if processed then return end
        
        if input.KeyCode == CONFIG.TOGGLE_KEY then
            self.visible = not self.visible
            self.frame.Visible = self.visible
        end
    end)
end

function App:Close()
    print("[BS Inventory Viewer] Closing...")
    self.gui:Destroy()
    script:Destroy()
end

-- ═══════════════════════════════════════════════════════════════════════════
-- STARTUP
-- ═══════════════════════════════════════════════════════════════════════════
App:Initialize()