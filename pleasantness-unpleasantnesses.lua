local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local TierColors = {
    Easy       = Color3.fromRGB(0, 255, 0),
    Medium     = Color3.fromRGB(218, 218, 0),
    Hard       = Color3.fromRGB(255, 170, 0),
    Difficult  = Color3.fromRGB(255, 0, 0),
    Intense    = Color3.fromRGB(65, 65, 65),
    Insane     = Color3.fromRGB(12, 44, 148),
    Extreme    = Color3.fromRGB(28, 142, 212),
    Terrifying = Color3.fromRGB(0, 255, 255),
    Ancient    = Color3.fromRGB(170, 85, 0),
    Elusive    = Color3.fromRGB(180, 180, 180),
    Supreme    = Color3.fromRGB(85, 0, 127),
    Fatality   = Color3.fromRGB(0, 70, 0),
}

local UNLISTED_COLOR = Color3.fromRGB(0, 0, 0)

local TierOrder = {
    "Easy", "Medium", "Hard", "Difficult", "Intense",
    "Insane", "Extreme", "Terrifying", "Ancient", "Elusive",
    "Supreme", "Fatality"
}

local TierPriority = {}
for i, name in ipairs(TierOrder) do
    TierPriority[name] = i
end

local Coolthing = {
    Easy = {
    "100k Alalal",
    "10k Alalal",
    "50k Alalal",
    "Alalal And Brash",
    "Alalal Cereal",
    "Alalal Cube",
    "Alalal Grapes",
    "Alalal On An Alalal",
    "Alalal Sticky Note",
    "Alalal XP",
    "Alalal-999",
    "Alawall",
    "Alien Alalal",
    "An Alalal With A Dream",
    "An Empty Alalal Beyond This World",
    "Autumn Tree Alalal",
    "Axolotl Alalal",
    "Bad Alalal",
    "Basic Alalal",
    "Beehive Alalal",
    "Bismuth Alalal",
    "Calalaltzo",
    "Carlalal",
    "Cat Emoji Alalal",
    "Chao Alalal",
    "Cheese Alalal",
    "Cheshire Cat Alalal",
    "Chiikawalalal",
    "Chocolate Milk Alalal",
    "Cloud and Storm Alalal",
    "Coconut Alalal",
    "Crumbled Alalal",
    "Dandelion Alalal",
    "Desert Traveler Alalal",
    "Dual Fruit Alalal",
    "Easy Alalal",
    "Egg Alalal",
    "Fisherman Alalal",
    "Floppalalal",
    "Flower Alalal",
    "Foliage Alalal",
    "Front Facing Alalal",
    "Gardener Alalal",
    "Graffiti Alalal",
    "Green Tea Alalal",
    "Gubby Alalal",
    "Helicopter Alalal",
    "Honeycomb Alalal",
    "Human Alalal",
    "Leaf Alalal",
    "Lil Alalal",
    "Lilypad Alalal",
    "Liminal Pop Alalal",
    "Long Alalal",
    "Magmalalal",
    "Mango Alalal",
    "Microbe Alalal",
    "Miner Alalal",
    "Misprint Alalal",
    "Money Alalal",
    "Monkey Alalal",
    "Myosotis Alalal",
    "Nerd Alalal",
    "Nyan Cat Alalal",
    "Octopus Alalal",
    "Orange Alalal",
    "Orange Juice Alalal",
    "Oversimplified Logo Alalal",
    "Peep Alalal",
    "Pet The Alalal",
    "Plaid Alalal",
    "Quartz Alalal",
    "Ralalal",
    "Rose Alalal",
    "Rotten Banana Alalal",
    "Ruined Alalal",
    "Salalad",
    "Shark Alalal",
    "Shell Alalal",
    "Snowman Alalal",
    "Spalalal and Meatbalalals",
    "Steeple Hill Alalal",
    "Stralalalberry",
    "Subtraction Alalal",
    "Swamp Alalal",
    "Temmie Alalal",
    "Teto Pear Alalal",
    "Ticket Alalal",
    "Tourist Alalal",
    "Tree Alalal",
    "Tupper Alalal",
    "Turnip Alalal",
    "Turtle Alalal",
    "Twig Alalal",
    "Vine Boom Alalal",
    "We have come for your Alalal",
    "Whimsical Cat Alalal",
    "Whoopie Cushion Alalal",
    "Wooden Alalal",
    "Yolky Alalal"
}
    Medium = {
"200k Alalal",
":3 Alalal",
"Alalal 4",
"Alalal 37",
"Alalal In The Box",
"Alalal Rider",
"Alalal Sing And Game Rhythm 9",
"Alalal Swarm Simulator",
"Alalal Tools",
"Alalal of Great Peaks",
"Alalal of Nothingness",
"Angler Alalal",
"Autumn Falls Alalal",
"Baby Alalal",
"Box Alalal",
"Bread Bun Alalal",
"Camo Alalal",
"Carrot Alalal",
"Clippy Alalal",
"Comic Alalal",
"Cool Alalal",
"Corny Alalal",
"Craftable Alalal",
"Disconsolate Alalal",
"Donut Cake Alalal",
"Druid Alalal",
"Earth Alalal",
"Empty Bag Alalal",
"FRIEND Alalal",
"Fluffy Alalal",
"Fossil Alalal",
"Frutiger DJ Alalal",
"Galalal",
"Garfield Alalal",
"Gold Alalal",
"Ice Cream Alalal",
"Ice Cream Sandwich Alalal",
"Jade Stone Alalal",
"Jinx Alalal",
"Leaf Pile Alalal",
"Maw Alalal",
"Meatball Alalal",
"Medium Alalal",
"Mon ala Lisa",
"Moss Alalal",
"Network Alalal",
"Neutron Star Alalal",
"Not So Inverted Alalal",
"Pet Alalal",
"Pillar John Alalal",
"Punkleton Alalal",
"Refrigerator Alalal",
"Road Rug Alalal",
"STOO Alalal",
"Sakura Alalal",
"Shedletsky Alalal",
"Stack of Alalal",
"Stuffed Alalal",
"Tbh Alalal",
"Tic-Tac-Alalal",
"Tidal Wave Alalal",
"Traffic Cone Alalal",
"Tree Sap Alalal",
"Waffle Alalal",
"Wah Alalal",
"Water Alalal",
"Watermelon Alalal",
"Whiz Bang Alalal",
"Wilted Rose Alalal",
"Yeah! Alalal",
"Zombie Alalal",
"c.s.q.a.l.a.l.a.l."
}
    Hard = {
"150k Alalal",
"2008 Alalal",
"3D Alalal",
"Aalalal",
"Addition Alalal",
"Alalal Dango",
"Alalal Has Seen The Nights",
"Alalal Komeiji",
"Alalal Meditation Is Incredible!",
"Alalal of Sunshine and Rainbows",
"Alalal of The Opera",
"Alalal Yo Kai Medal",
"Alalal of Wisdom",
"Alalalbrave",
"Angzarr Alalal",
"Antimatter Alalal",
"Apple Alalal",
"Atom Alalal",
"Balloon Alalal",
"Banana Alalal",
"Bee Alalal",
"Binary Alalal",
"Bisonorus Alalal",
"Blackhole Alalal",
"Blueprint Alalal",
"Bomb Alalal",
"Burned Alalal",
"Butterfly Alalal",
"Casualalal",
"Caterpillar Alalal",
"Checkerboard Alalal",
"Cheeseball Alalal",
"Clay Alalal",
"Click the Balalart",
"Clock Alalal",
"Conglomeralalal",
"Cotton Candy Alalal",
"David Alalal",
"Dessert Alalal",
"Diamond With An Alalal In The Middle",
"Digital Alalal",
"Dry Ice Alalal",
"Elliot Alalal",
"Engineering Alalal",
"Error: Missing Source",
"Eviler Alalal",
"Fabric Alalal",
"Geometrical Alalal",
"Gnalalarls",
"Gomer Alalal",
"Grass Alalal",
"Halalal",
"Hard Alalal",
"Icy Alalal",
"Lemon Alalal",
"Lickitung Alalal",
"Lost Note Alalal",
"Malalal",
"Melting Alalal",
"Moon Alalal",
"Mouthless Alalal",
"Particle Emitter Alalal",
"Patatatatrick",
"Pou Alalal",
"Power Point Presentalalaltion",
"Rainbow Alalal",
"Real Watcher Alalal!!!",
"Ruined Structure Alalal",
"Scribbalalal",
"Shapey Alalal",
"Silly Alalal",
"Skull Painting Alalal",
"Slate Alalal",
"Sleep Deprived Alalal",
"Sleeping Alalal",
"Snowbalalal",
"Spave",
"Spawn Alalal",
"Spring Marsh Alalal",
"Star Alalal",
"Starting Place Alalal",
"Statue Alalal",
"Steve Alalal",
"Stone Hard Alalal",
"Swag Alalal",
"Swirlalal",
"Technical Difficulty Alalal",
"Technophobialalal",
"Telalalalmon",
"Tennis Ballalal",
"TROGDOR Alalal",
"Trojan Alalal",
"True Alalal",
"Unstuffed Alalal",
"Valalal",
"Wallhop Alalal",
"Witness Alalal",
"Xalalal",
"Yalalal",
"Yoyo Alalal",
"Zombie Trait Alalal"
}
    Difficult = {
"[Alalal Deleted]",
"Abandoned Doll Alalal",
"Alalal Plinko",
"Alien Bunny Alalal",
"An Alalal Located Here In The Space Area",
"Ant Alalal",
"Barnacled Alalal",
"Bean Alalal",
"Big Bird Alalal",
"Boba Alalal",
"Bronze Alalal",
"Burning Alalal Subarea Alalal",
"Bygone Core Alalal",
"CAR Alalal",
"Caesar Alalal",
"Cherry Alalals",
"Combination Lock Alalal",
"Cruelelel",
"Diamond Plate Alalal",
"Difficult Alalal",
"Dirt Weaver Alalal",
"Electricity Alalal",
"Enigmatic Sunset Alalal",
"ewie Alalal",
"Firework Alalal",
"Fuzzy Alalal",
"Galactic Alalal",
"Gear Alalal",
"Globalalal",
"Gooblet Gang Alalal",
"Gummy Alalal",
"Hangman Alalal",
"Happy Star Alalal",
"Hoarfrost Alalal",
"Honey Alalal",
"Igneous Alalal",
"Imaginary Alalal",
"Lion Alalal",
"Luminescent Fungus Alalal",
"Marble Alalal",
"Material Backrooms Alalal",
"Miraheze Alalal",
"Moai Alalal",
"Monculus Alalal",
"Mount Eerie Alalal",
"Nightmare Alalal",
"Overgrown Alalal",
"Pear Alalal",
"Pixel Alalal",
"Pong Ping Alalal",
"proof you i dont cheat in find the alalals",
"Pumpkin Creature Alalal",
"Rafflesialalal",
"Real Reaction",
"Salalal",
"Sam",
"Scrapped Alalal",
"Sea Mine Alalal",
"Sleeping Skipper Alalal",
"Slide 99999 Meters Down Alalal",
"Slushy Alalal",
"Spongalalal",
"Sun Alalal",
"Swirlalal Subarea Alalal",
"Text Alalal",
"The Silliest Alalal Ever",
"Thunderous Alalal",
"Trollalalal Egg",
"Ualalal",
"Ultralalal",
"Untextured Alalal",
"Waldo Alalal",
"Webdriver Alalal",
"Will O' Wisp Alalal",
"Wiwiwi",
"Worker Alalal"
}
    Intense = {
"250k Alalal",
"A Floating Shopping Alalalist",
"Absolut DestructionK Alalal",
"Acorn Alalal",
"Aeroplane Alalal",
"Alalal_greensheep",
"Alalal-Rayet",
"Alalal.exe",
"Alalal5",
"Alalal 618",
"Alalal at 3am",
"Alalal Cinema",
"Alalal of Horror",
"Alalal of Liberty",
"Alalal of Mixed Colors",
"Alalal of True Luck",
"Alalalist",
"Algaga",
"Almond Water Alalal",
"Atlantic Alalal",
"Audio Alalal",
"Backrooms Alalal",
"Ball Dropper Alalal",
"Beachy Alalal",
"Blacephalalal",
"Bodyless Alalal",
"Brick Alalal",
"Builder Alalal",
"Burning Alalal Subarea Alalal Location Alalal",
"Cat Lamp Alalal",
"Cave Dweller Alalal",
"City Slicker Alalal",
"Constellation Alalal",
"Conveniently-shaped Alalal",
"Corn Alalal",
"Cornlight Lantern Alalal",
"Deceitful Alalal",
"Detective Alalal",
"Dumb Pumpkin Alalal",
"Eggdog Alalal",
"Eternal Moth Alalal",
"Exotic Egg Alalal",
"Eyeless Alalal",
"Fire In The Alalal",
"FISH ALALAL",
"Forbidden Flower Alalal",
"Ghost Alalal",
"Imposter Alalal",
"Intense Alalal",
"Jalalal",
"Japanese Ogre Alalal",
"Lolz Alalal",
"Lost Alalal",
"Magmatic Duration Alalal",
"Mech Alalal",
"Midnight Alalal",
"Minesweeper Alalal",
"Mini A.L.A.L.A.L",
"Nerald",
"Overgrown Structure Alalal",
"Pancake Alalal",
"Pill Jar Alalal",
"Pink Corn Alalal",
"Quiet Alalal",
"Radicalalal",
"Rainbow Lemonade Alalal",
"Ramen Alalal",
"Reflective Alalal",
"Rotten Honey Alalal",
"S-41",
"Sapphire Alalal",
"Secret Alalal",
"Simulation Alalal",
"Sinister Alalal",
"Skybox Alalal",
"Snake Alalal",
"Snow Fairy Alalal",
"Stalker Alalal",
"Steampunk Pursuer Alalal",
"Stellar Alalal",
"Stormy Cloud Alalal",
"Surrealism Alalal",
"Taiyaki Alalal",
"Temporal Magmalalal",
"Toe Jammer Alalal",
"Toy Alalal",
"Traffic Light Alalal",
"Turmoil Alalal",
"Two-Faced Alalal",
"UTC Alalal",
"Vicious Alalal",
"Voodoo Doll Alalal",
"Whaillalal",
"Zeus Alalal"
}
    Insane = {
":)",
"Alalal Chips",
"Alalal Cholo",
"Alalal of Fading Light",
"Alalal of Invisible Walls",
"Alalal of Reflective Shapes",
"Alalal of Shapes",
"Alternate Alalal",
"Basic's Alalal",
"Bé Poise Alalal",
"Bedrock Alalal",
"Bioluminescent Alalal",
"Building Alalal",
"Burgr Alalal 2: Return of Burgr",
"Burning Alalal",
"Burning Alalal Subarea Alalal Location Alalal Subarea Alalal",
"Cataclysmic Warcry Alalal",
"Cataliszt Alalal",
"Cookie Clicker Alalal",
"Coralalal",
"Corn Maze Alalal",
"Corn on a Unicycle Alalal",
"Crossbow Master Alalal",
"Crystal Depths Alalal",
"Devourer of Alalals",
"Division Alalal",
"Don't Break The Chain Alalal",
"Dozer Alalal",
"Emerald Alalal",
"Emo Alalal",
"Emoji Alalal",
"Epic Alalal",
"Exponent Alalal",
"Fake Reaction",
"False Alalal",
"Fan Alalal",
"Floating Point Alalal",
"Glaggle Alalal",
"Glass Alalal",
"Guide Alalal",
"Hashalalaltag",
"Hourglass Alalal",
"Imp Alalal",
"Insane Alalal",
"Jeff The Alalal",
"Jewel Alalal",
"Jim",
"Johan",
"John Pork Alalal",
"Kiwi Alalal",
"Level √2: \"Irrationalalal\"",
"Light Bulb Alalal",
"Light Devourer Alalal",
"Mechanical Juggernaut Alalal",
"Meebkin Alalal",
"Mega Secret Alalal",
"Mimic Alalal",
"Modern Roblox Alalal",
"Moss Bubble Alalal",
"Moth Alalal",
"mr stanley",
"MS Paint Alalal",
"MY ALALAL",
"Noakalalal",
"Opposite Day Alalal",
"Parasite Alalal",
"Prism Alalal",
"Puppet Alalal",
"Raven Alalal",
"Real Plushie Alalal",
"Reapers Victim Alalal",
"Red Evil Alalal",
"Remorseless Alalal",
"Roblox Studio Alalal",
"Rotten Flesh Alalal",
"Scarecrow Alalal",
"Scarlet Persecutor Alalal",
"Silver Alalal",
"Skittles Alalal",
"Spin To Win Alalal",
"Sqrtalalal",
"Square Root Alalal",
"Starcatcher Alalal",
"Static Alalal",
"Sticker Alalal",
"Tabby Alalal",
"THE aLaLAl?",
"The Great Alalal",
"Toxic Alalal",
"Tranquility Alalal",
"Trick or Treater Alalal",
"Triple Alalalberry Sunrise",
"Troll Alalal",
"Uncanny Alalal",
"Über Alalal",
"Walalal",
"Whar Alalal",
"World of Goo Alalal",
"Wumpa Fruit Alalal",
"Zalalal"
}
    Extreme = {
"A Great Tongue Battler",
"Abyssal Pest Alalal",
"Alalal Dictionary",
"Alalal With It",
"Alalal of Absolute Zero",
"Alalalception",
"Alalol Oni",
"Archaic Alalal",
"Blue Lord Alalal",
"Blue Moon Alalal",
"Broken Script Alalal",
"Casino Alalal",
"Chomik Alalal",
"Chronos Mangrove Alalal",
"Confused Alalal",
"Cyriak Alalal",
"Dark House Alalal",
"Decaying Roots Alalal",
"Deep Sea Alalal",
"Diamond Alalal",
"Difficulty Chart Alalal",
"Divine Spave",
"Don't Press The Alalal",
"Drowning Alalal",
"Elemental Alalal",
"Enphoso Alalal",
"Ever Dream this Alalal?",
"Evil Alalal",
"Extreme Alalal",
"Fabled Glowbulb Alalal",
"False Root Alalal",
"Firefighter Alalal",
"Frutiger Aero Alalal",
"FUN ALALAL",
"Gluttonous Alalal",
"Greedy Alalal",
"H2Alalal",
"Herald",
"Hyena Alalal",
"Imagination Garden Alalal",
"Invisible Alalal",
"Lalala",
"Leviathan Alalal",
"Magmatic Factory Alalal",
"Mayhem Alalal",
"Meaningless Alalal",
"Peppino Alalal",
"Pirate Ship Alalal",
"Poll Alalal",
"Poopy",
"Porcelain Dipper Alalal",
"Rooted Mutation Alalal",
"Rotten Sludge Alalal",
"Rubik's Alalal",
"Runic Alalal",
"Sea Devil Alalal",
"Shiny Alalal",
"SOMETHINGBADWILLHAPPENSOON Alalal",
"Spectral Diffusion Alalal",
"Sun and Moon Alalal",
"Terminal Alalal",
"Terrified Alalal",
"The Battle Alalals",
"The Judge Alalal",
"THIS Alalal",
"Title",
"Trr Secret Alalal",
"Twisted Squid Alalal",
"Void Alalal",
"Void Dweller Alalal",
"Wikipedialalal",
"Withered Flower Alalal"
}
    Terrifying = {
" ",
"Abyssal Wretch Alalal",
"Alalal Located In This Image",
"Alalal Of Void",
"Alalal of Mixed Temperatures",
"Alalaki No Puzzle",
"Awesome Update Alalal",
"Biblical Machinery Alalal",
"Bill Cipher Alalal",
"Bird Owlalal",
"Boss Fight Alalal",
"City Alalal",
"Clockwork Alalal",
"Confinement Feeling Alalal",
"Cookie God Alalal",
"Divine Pathogen Alalal",
"Faceless Alalal",
"Fallen Alalal",
"Fatal Secret Alalal",
"Flesh Eater Alalal",
"Fuwalalatti",
"Ghalalazt",
"Grim Cultist Alalal",
"Hawaii: Part II Alalal",
"Inverted Alalal",
"JALALAL//VOIDED",
"Jerald",
"King Slime Alalal",
"Kryptos Alalal",
"Lunar Apocalypse Alalal",
"Metamorphosis Alalal",
"Multiplication Alalal",
"Mustard Alalal",
"Nil Alalal",
"Null Alalal",
"Obelisk Alalal",
"Obliterated Alalal",
"Outline Alalal",
"Partygoer Alalal",
"Party Addition Alalal",
"Planteralalal",
"Purplalal",
"Rogue Reaper Alalal",
"Rolling Sky Alalal",
"Scientist Alalal",
"Scrap Apotheosis Alalal",
"Sensory Consternation Alalal",
"Sin(Alalal)",
"Smiler Alalal",
"Springtrap Alalal",
"Sqroscalalal-2",
"Teddy Alalalpin",
"Terrifying Alalal",
"Virtual Corruption Alalal",
"What is horror?"
}
    Ancient = {
"Abyssal Overseer Alalal",
"Alalal -4",
"Alalal of Exhaustion",
"Alalal The Providence",
"Ancient Alalal",
"Bo Alalal",
"Board Game Alalal",
"Boss Rush Alalal",
"Broken Alalal",
"Classic Roblox Alalal",
"Demon Core Alalal",
"Disorder Alalal",
"Eye of the Vortex Alalal",
"Final Stretch Alalal",
"Flare Alalal",
"Four-Way-Fractured Alalal",
"Homage Alalal",
"Infinity Alalal",
"Jecret Alalal",
"Low Quality Alalal",
"NOT Alalal",
"Parasitic God Alalal",
"PSI Alalal",
"Sacred Bell Alalal",
"Scoobis",
"Trollge Alalal",
"Virus Alalal",
"ζωηρός"
}
    Elusive = {
"Alalal Night",
"Alalal of Different Realities",
"Carrot Alalal Ascended",
"Erosion Helllord Alalal",
"False God Alalal",
"Humanoid Alalal",
"School Alalal",
"Vetiti Secret Alalal"
}
    Supreme = {
"Biblically Accurate Alalal",
"Broken Reality Alalal",
"Desmos Alalal",
"Gamma Secret Alalal",
"Universal Collapse Alalal"
    },
    Fatality = {
        "Lost In Time Alalal","Watcher Alalal"
    },
}

local NameToTier = {}

local function registerName(name, tier)
    local existing = NameToTier[name]
    if not existing or TierPriority[tier] > TierPriority[existing] then
        NameToTier[name] = tier
    end
end

for tierName, list in pairs(Coolthing) do
    for _, name in ipairs(list) do
        registerName(name, tierName)
    end
end

local enabledTiers = {}
for _, tier in ipairs(TierOrder) do
    enabledTiers[tier] = true
end

local showUnlisted = true

local originalHighlights = {}

local function normalizeName(str)
    return (str:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function getOrCreateHighlight(part)
    local hl = part:FindFirstChildOfClass("Highlight")
    if not hl then
        hl = Instance.new("Highlight")
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Parent = part
        originalHighlights[part] = false -- we created it
    else
        if originalHighlights[part] == nil then
            originalHighlights[part] = hl.FillColor
        end
    end
    return hl
end

local function removeOwnedHighlight(part)
    if originalHighlights[part] == false then
        local hl = part:FindFirstChildOfClass("Highlight")
        if hl then hl:Destroy() end
        originalHighlights[part] = nil
    elseif originalHighlights[part] ~= nil then
        local hl = part:FindFirstChildOfClass("Highlight")
        if hl then hl.FillColor = originalHighlights[part] end
        originalHighlights[part] = nil
    end
end

local function applyHighlights()
    local Jejunojejunostomies = Workspace:FindFirstChild("alalals")
    if not Jejunojejunostomies then
        return
    end

    for part in pairs(originalHighlights) do
        if not part.Parent then
            originalHighlights[part] = nil
        end
    end

    for _, part in ipairs(Jejunojejunostomies:GetDescendants()) do
        if part:IsA("BasePart") then
            local cleanName = normalizeName(part.Name)
            local tier = NameToTier[cleanName]

            if tier then
                if enabledTiers[tier] then
                    local hl = getOrCreateHighlight(part)
                    hl.FillColor = TierColors[tier]
                    hl.OutlineColor = TierColors[tier]
                else
                    removeOwnedHighlight(part)
                end
            else
                if showUnlisted then
                    local hl = getOrCreateHighlight(part)
                    hl.FillColor = UNLISTED_COLOR
                    hl.OutlineColor = UNLISTED_COLOR
                else
                    removeOwnedHighlight(part)
                end
            end
        end
    end
end

local function createGUI()
    -- FIX: was checking "AlalalHighlighterGUI" but the GUI is named
    -- "antiantiskeppy", so the old one was never destroyed on re-run.
    local old = player:WaitForChild("PlayerGui"):FindFirstChild("antiantiskeppy")
    if old then old:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "antiantiskeppy"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 300, 0, 560)
    frame.Position = UDim2.new(1, -310, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 36)
    title.BackgroundTransparency = 1
    title.Text = "antiantiskeppy"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = frame

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -20, 1, -170)
    scroll.Position = UDim2.new(0, 10, 0, 40)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 6
    scroll.Parent = frame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 4)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scroll

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end)

    local buttons = {}
    local unlistedBtn

    local function refreshButtons()
        for tier, btn in pairs(buttons) do
            if enabledTiers[tier] then
                btn.BackgroundColor3 = TierColors[tier]
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Text = "✓  " .. tier
            else
                btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                btn.TextColor3 = Color3.fromRGB(160, 160, 160)
                btn.Text = "✗  " .. tier
            end
        end
        if unlistedBtn then
            if showUnlisted then
                unlistedBtn.BackgroundColor3 = UNLISTED_COLOR
                unlistedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                unlistedBtn.Text = "✓  Unlisted (Black)"
            else
                unlistedBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                unlistedBtn.TextColor3 = Color3.fromRGB(160, 160, 160)
                unlistedBtn.Text = "✗  Unlisted (Black)"
            end
        end
    end

    local function makeButton(text, layoutOrder, onClick, customColor)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.BackgroundColor3 = customColor or Color3.fromRGB(55, 55, 55)
        btn.BorderSizePixel = 0
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.LayoutOrder = layoutOrder
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 4)
        c.Parent = btn
        btn.MouseButton1Click:Connect(onClick)
        return btn
    end

    for i, tier in ipairs(TierOrder) do
        local btn = makeButton("", i, function()
            enabledTiers[tier] = not enabledTiers[tier]
            refreshButtons()
            applyHighlights()
        end)
        btn.Parent = scroll
        buttons[tier] = btn
    end

    unlistedBtn = makeButton("", 200, function()
        showUnlisted = not showUnlisted
        refreshButtons()
        applyHighlights()
    end)
    unlistedBtn.Parent = scroll

    local allBtn = makeButton("Select All", 100, function()
        for _, t in ipairs(TierOrder) do enabledTiers[t] = true end
        showUnlisted = true
        refreshButtons()
        applyHighlights()
    end, Color3.fromRGB(0, 120, 60))
    allBtn.Parent = frame
    allBtn.Position = UDim2.new(0, 10, 1, -125)
    allBtn.Size = UDim2.new(0.5, -15, 0, 32)

    local noneBtn = makeButton("Deselect All", 101, function()
        for _, t in ipairs(TierOrder) do enabledTiers[t] = false end
        showUnlisted = false
        refreshButtons()
        applyHighlights()
    end, Color3.fromRGB(150, 30, 30))
    noneBtn.Parent = frame
    noneBtn.Position = UDim2.new(0.5, 5, 1, -125)
    noneBtn.Size = UDim2.new(0.5, -15, 0, 32)

    local refreshBtn = makeButton("Refresh", 102, function()
        applyHighlights()
    end, Color3.fromRGB(40, 90, 160))
    refreshBtn.Parent = frame
    refreshBtn.Position = UDim2.new(0, 10, 1, -85)
    refreshBtn.Size = UDim2.new(1, -20, 0, 32)

    local statusLbl = Instance.new("TextLabel")
    statusLbl.Size = UDim2.new(1, -20, 0, 36)
    statusLbl.Position = UDim2.new(0, 10, 1, -45)
    statusLbl.BackgroundTransparency = 1
    statusLbl.Text = "Unlisted parts → black"
    statusLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLbl.Font = Enum.Font.Gotham
    statusLbl.TextSize = 12
    statusLbl.TextXAlignment = Enum.TextXAlignment.Left
    statusLbl.Parent = frame

    refreshButtons()
end

createGUI()

if not Workspace:FindFirstChild("alalals") then
    local conn
    conn = Workspace.ChildAdded:Connect(function(child)
        if child.Name == "alalals" then
            conn:Disconnect()
            applyHighlights()
        end
    end)
end

task.wait(0.5)
applyHighlights()

local pending = false
Workspace.DescendantAdded:Connect(function(inst)
    if not inst:IsA("BasePart") then return end
    local p = inst.Parent
    while p and p ~= Workspace do
        if p.Name == "alalals" then
            if not pending then
                pending = true
                task.delay(0.5, function()
                    pending = false
                    applyHighlights()
                end)
            end
            break
        end
        p = p.Parent
    end
end)