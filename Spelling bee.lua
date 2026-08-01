local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local Unpatchabomb = Instance.new("ScreenGui")
local UnpatchabombFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local LetterBox = Instance.new("TextBox")
local AutoBtn = Instance.new("TextButton")
local WordText = Instance.new("TextLabel")
local TopFrame = Instance.new("Frame")
local T1 = Instance.new("TextLabel")
local T2 = Instance.new("TextLabel")
local ReloadBtn = Instance.new("TextButton")

local SuggestionList = Instance.new("ScrollingFrame")
local ListLayout = Instance.new("UIListLayout")

-- Hardcoded Dictionary
local HARDCODED_WORDS = {
    "aim",
    "lip",
    "air",
    "baby",
    "bad",
    "bag",
    "ball",
    "bar",
    "bat",
    "bed",
    "bee",
    "best",
    "big",
    "bird",
    "blue",
    "book",
    "bug",
    "bus",
    "cake",
    "car",
    "cat",
    "cool",
    "cow",
    "cry",
    "cup",
    "dad",
    "dog",
    "door",
    "twin",
    "stem",
    "abolish",
    "absence",
    "abstract",
    "agaric",
    "agnostic",
    "akin",
    "albeit",
    "alliance",
    "alphabet",
    "anatomical",
    "answer",
    "appetite",
    "armor",
    "atone",
    "automatic",
    "await",
    "bamboo",
    "bayonet",
    "beach",
    "betray",
    "biography",
    "bizarre",
    "breakthrough",
    "broccoli",
    "catalog",
    "center",
    "chicken",
    "chronic",
    "church",
    "congratulate",
    "cooking",
    "curious",
    "daffodil",
    "damage",
    "debris",
    "diesel",
    "dilate",
    "dolphin",
    "enact",
    "excellent",
    "familiar",
    "firefighter",
    "flavor",
    "formidable",
    "frolic",
    "furious",
    "gallant",
    "gradual",
    "growl",
    "guideline",
    "harbor",
    "heresy",
    "immobilize",
    "integrity",
    "ionize",
    "lactose",
    "lather",
    "leafy",
    "liable",
    "lightning",
    "magnificent",
    "meditate",
    "normal",
    "oasis",
    "obesity",
    "offender",
    "overdue",
    "paradox",
    "password",
    "pigeon",
    "plethora",
    "powder",
    "present",
    "probably",
    "pulsar",
    "pumpkin",
    "pursuit",
    "recipient",
    "refrain",
    "refugee",
    "remarkable",
    "rooster",
    "rye",
    "scrutiny",
    "secret",
    "seldom",
    "semicircle",
    "sigma",
    "sleigh",
    "sniffle",
    "special",
    "spooky",
    "strategic",
    "subsidy",
    "sunflower",
    "swamp",
    "syntax",
    "tangerine",
    "telepathy",
    "thesis",
    "tremendous",
    "twenty",
    "uncomfortable",
    "understand",
    "vague",
    "villain",
    "voluntary",
    "walnut",
    "warrior",
    "window",
    "zombie",
    "duck",
    "eat",
    "egg",
    "elf",
    "end",
    "eye",
    "face",
    "fire",
    "fish",
    "five",
    "food",
    "foot",
    "four",
    "go",
    "gold",
    "hand",
    "hat",
    "ink",
    "job",
    "jog",
    "kiss",
    "milk",
    "mix",
    "mom",
    "moon",
    "mug",
    "noob",
    "one",
    "pan",
    "pie",
    "pink",
    "rain",
    "rat",
    "red",
    "ruby",
    "run",
    "sit",
    "size",
    "snow",
    "soda",
    "star",
    "stop",
    "suck",
    "sun",
    "tag",
    "tank",
    "tap",
    "three",
    "town",
    "tree",
    "two",
    "water",
    "wind",
    "word",
    "zoo",
    "absorb",
    "angel",
    "ash",
    "bark",
    "basket",
    "bean",
    "bingo",
    "black",
    "bomb",
    "boss",
    "brain",
    "bread",
    "brown",
    "bunny",
    "burger",
    "burial",
    "cabin",
    "circle",
    "clever",
    "cliff",
    "clock",
    "clutch",
    "comply",
    "convey",
    "crowd",
    "dairy",
    "defy",
    "demon",
    "echo",
    "emoji",
    "erupt",
    "exert",
    "exile",
    "film",
    "filter",
    "flower",
    "foggy",
    "forbid",
    "fry",
    "gender",
    "ghost",
    "giant",
    "greedy",
    "green",
    "grub",
    "hair",
    "hello",
    "hotel",
    "house",
    "human",
    "hunt",
    "hungry",
    "intent",
    "iron",
    "irony",
    "lake",
    "land",
    "length",
    "margin",
    "melt",
    "meow",
    "monk",
    "nest",
    "noble",
    "orange",
    "park",
    "pasta",
    "pear",
    "power",
    "prank",
    "pray",
    "proof",
    "quack",
    "queen",
    "quill",
    "rally",
    "random",
    "reply",
    "robust",
    "rot",
    "seed",
    "shake",
    "shark",
    "sigh",
    "sock",
    "spring",
    "state",
    "stew",
    "still",
    "stumble",
    "trauma",
    "twist",
    "update",
    "vein",
    "walk",
    "way",
    "white",
    "workout",
    "wrist",
    "abditive",
    "abdomen",
    "abhorrent",
    "abscond",
    "accommodate",
    "accomplishment",
    "accumulation",
    "adolescent",
    "adversity",
    "aegis",
    "aerodynamic",
    "agriculture",
    "apostrophe",
    "arcane",
    "articulate",
    "aspiration",
    "assumption",
    "asthma",
    "asunder",
    "atmospheric",
    "beneficiary",
    "benevolence",
    "blizzard",
    "blossom",
    "bronchitis",
    "brusque",
    "calibration",
    "callow",
    "candlelight",
    "caustic",
    "champagne",
    "charisma",
    "chlorophyll",
    "christmas",
    "clowder",
    "cognitive",
    "colonel",
    "combustible",
    "commemorate",
    "commodity",
    "concentration",
    "consumption",
    "contour",
    "controversial",
    "cuisine",
    "dauntless",
    "deployment",
    "derogatory",
    "detrimental",
    "differentiation",
    "diplomatic",
    "disappointment",
    "disconsolate",
    "division",
    "doctrine",
    "elaborate",
    "embarrassment",
    "embassy",
    "enchantment",
    "encore",
    "endeavor",
    "environmental",
    "epiphany",
    "epsilon",
    "erratic",
    "ethereal",
    "euphoria",
    "exaggerate",
    "excalibur",
    "exorcism",
    "expenditure",
    "exponential",
    "extravagant",
    "fantasy",
    "favorable",
    "featherweight",
    "fictitious",
    "fjord",
    "flamboyant",
    "fluorescent",
    "forthcoming",
    "frostbite",
    "fruition",
    "fugacious",
    "gastronomic",
    "gazebo",
    "germination",
    "gibberish",
    "gingerbread",
    "glacier",
    "gratitude",
    "gravestone",
    "hailstone",
    "heritage",
    "hexagonal",
    "hibernation",
    "hornswoggle",
    "hourglass",
    "humanitarian",
    "hypothesis",
    "ideological",
    "idiom",
    "imminent",
    "imprisonment",
    "independence",
    "indifference",
    "inhabitant",
    "insinuate",
    "insipid",
    "integration",
    "intermediate",
    "intermission",
    "introspect",
    "jaded",
    "juxtaposition",
    "kangaroo",
    "languid",
    "legendary",
    "limina",
    "limousine",
    "livery",
    "mathematician",
    "melancholy",
    "metabolism",
    "methodology",
    "microorganism",
    "misconception",
    "mistletoe",
    "multiplication",
    "myopic",
    "nebulous",
    "necromancer",
    "negotiation",
    "neighboring",
    "nonplussed",
    "notorious",
    "obituary",
    "oblivious",
    "opaque",
    "optimism",
    "palatine",
    "pantograph",
    "paradise",
    "paragon",
    "parallel",
    "participation",
    "passionate",
    "peppermint",
    "periodically",
    "personnel",
    "pestilence",
    "photographer",
    "pomegranate",
    "portfolio",
    "practitioner",
    "predominantly",
    "problematic",
    "proclamation",
    "procrastinate",
    "pronunciation",
    "propaganda",
    "protocol",
    "pygmy",
    "ravenous",
    "recession",
    "reincarnation",
    "reliability",
    "residential",
    "resilience",
    "resurrection",
    "revelation",
    "rhythm",
    "ricochet",
    "sabotage",
    "sachet",
    "sapphire",
    "scholarship",
    "scythe",
    "sentimental",
    "separation",
    "shareholder",
    "significance",
    "skeleton",
    "snowflake",
    "solidarity",
    "spokesperson",
    "steadfast",
    "stereotype",
    "supposedly",
    "surrogate",
    "surveillance",
    "susceptible",
    "syllable",
    "symmetrical",
    "systematic",
    "technological",
    "thesaurus",
    "transaction",
    "translucent",
    "transparency",
    "transportation",
    "unprecedented",
    "validity",
    "venerate",
    "violation",
    "vulnerability",
    "wednesday",
    "wholeheartedly",
    "worthwhile",
    "acetylglucocoroglaucigenin",
    "adrenocorticotrophin",
    "anthropomorphisation",
    "antidisestablishmentarianism",
    "antixerophthalmic",
    "bourgeoisification",
    "bromochlorodifluoromethane",
    "canaliculodacryocystorhinostomy",
    "chargoggagoggmanchauggagoggchaubunagungamaugg",
    "cholangiocholecystocholedochectomy",
    "cholangiopancreatography",
    "chondromyxohemangioendotheliosarcoma",
    "congenitalnasalmeningoencephalocele",
    "convolvulaceous",
    "corticopontocerebellar",
    "corynebacteriumpseudotuberculosis",
    "counterimmunoelectrophoresis",
    "dehydrothiotoluidine",
    "dermatofibrosarcomaprotuberans",
    "dermatofibrosislenticularisdisseminata",
    "dextrodeorsumversion",
    "dichlorodiphenyltrichloroethane",
    "diisopropylfluorophosphate",
    "dimethyldioctadecylammoniumchloride",
    "eellogofusciouhipoppokunurious",
    "encephalocraniocutaneouslipomatosis",
    "erythrocytapheresis",
    "esophagogastroduodenoscopy",
    "ferriprotoporphyrin",
    "floccinaucinihilipilification",
    "fluorotetraferriphlogopite",
    "fructosebisphosphatetriosephosphatelyase",
    "funkenzwangsvorstellung",
    "gastrocnemiosemimembranous",
    "gastroenterologist",
    "gegenstandstheorie",
    "hematospectrophotometrically",
    "hexakosioihexekontahexaphobia",
    "hippopotomonstrosesquippedaliophobia",
    "honorficabilitudinity",
    "hypothalamicpituitaryadrenocortical",
    "immunoelectrochemiluminescence",
    "inositolphosphorylceramide",
    "laparohysterosalpingooophorectomy",
    "laryngotracheobronchitis",
    "loncastuximabtesirine",
    "lymphangioleiomyomatosis",
    "micropachycephalosaurus",
    "neohesperidindihydrochalcone",
    "nonanonacontanonactanonaliagon",
    "nucleotidylexotransferase",
    "orotatephosphoribosyltransferase",
    "otorhinolaryngological",
    "paroxysmalnocturnalhemoglobinuria",
    "percutaneousendoscopicgastrostomy",
    "phosphorodiamidatemorpholinooligomer",
    "photoplethysmography",
    "pneumoencephalography",
    "pneumonoultramicroscopicsilicovolcanoconiosis",
    "polyphiloprogenitive",
    "pseudopseudohypoparathyroidism",
    "pseudorhombicuboctahedron",
    "psychoneuroendocrinological",
    "psychophysicotherapeutics",
    "pyrrolizidinealkaloidosis",
    "ribulosebisphosphatecarboxylaseoxygenase",
    "scaphotrapeziotrapezoidosteoarthritis",
    "sclerectoiridectomy",
    "spectrophotofluorometry",
    "sphenopalatineganglioneuralgia",
    "sphygmomanometer",
    "stereoelectroencephalography",
    "supercalifragilisticexpialidocious",
    "thyroparathyroidectomy",
    "tonsillopharyngitis",
    "uridinediphosphateglycosyltransferase",
    "uvulopalatopharyngoplasty",
    "ventriculocisternostomy",
    "xanthogranulomatouspyelonephritis",
    "zoanthroprosopometamorphopsia",
    "abacaxi",
    "abasia",
    "acculturate",
    "aforementioned",
    "aggrandize",
    "agoraphobia",
    "agoraphobic",
    "altruistic",
    "ambidextrous",
    "ambiguous",
    "anaphylactic",
    "anemone",
    "anisosquaric",
    "apocryphal",
    "apothecary",
    "asphyxiation",
    "astigmatism",
    "ataraxy",
    "attorney",
    "bandeau",
    "belvedere",
    "betwixt",
    "blatherskite",
    "bodacious",
    "bogolanfini",
    "brucellosis",
    "bucolic",
    "cacophony",
    "calamitous",
    "calumny",
    "capoeira",
    "capricious",
    "captious",
    "cerulean",
    "charcuterie",
    "chauffeur",
    "chronological",
    "cinematographer",
    "clairvoyant",
    "clandestine",
    "coalescence",
    "codicil",
    "colloquialism",
    "comeuppance",
    "commodore",
    "compunction",
    "congregation",
    "consanguine",
    "consummate",
    "contradistinguish",
    "convivial",
    "correspondence",
    "counterintuitive",
    "culvert",
    "cyrillic",
    "defenestration",
    "deleterious",
    "depilatory",
    "diminution",
    "discombobulate",
    "dodecahedron",
    "ebullition",
    "eloquent",
    "elysian",
    "ennui",
    "epitome",
    "erroneous",
    "erudition",
    "esurient",
    "ethnomethodology",
    "evanesce",
    "extraterrestrial",
    "facsimile",
    "fastidious",
    "fissiparous",
    "flummox",
    "foible",
    "folliculitis",
    "fuchsia",
    "garrulous",
    "gentrification",
    "glaucomatous",
    "glockenspiel",
    "gobbledygook",
    "grandiloquent",
    "handkerchief",
    "harpsichord",
    "hemoglobin",
    "heterozygous",
    "hierarchy",
    "homeopathy",
    "homogeneous",
    "horticulturist",
    "hypermetropia",
    "iconoclast",
    "idiosyncratic",
    "incandescent",
    "inchoate",
    "incoagulable",
    "indefatigable",
    "ingenious",
    "irascible",
    "ishmus",
    "isometropia",
    "kaleidoscope",
    "lachrymose",
    "latitudinarian",
    "latitudinarianism",
    "legislation",
    "lexicography",
    "liaison",
    "loquacious",
    "lugubrious",
    "lymphangiography",
    "macabre",
    "magniloquent",
    "malapropism",
    "martyrdom",
    "mellifluous",
    "menagerie",
    "mendacious",
    "meretricious",
    "metempsychosis",
    "microminiaturization",
    "milieu",
    "minuscule",
    "miscellaneous",
    "monochromatic",
    "monosyllabic",
    "multidimensionality",
    "municipal",
    "myriad",
    "narcissistic",
    "nauseous",
    "neophyte",
    "neuroplasticity",
    "nincompoop",
    "nocturne",
    "nomenclature",
    "noumenon",
    "nutritious",
    "obfuscation",
    "occhiolism",
    "onomatopoeia",
    "abdominothoracic",
    "absquatulate",
    "acetaminophen",
    "achromatophil",
    "achromatophilia",
    "allotransplantation",
    "anachronistic",
    "aneurysmorrhaphy",
    "antediluvian",
    "arthroereisis",
    "ascosporogenous",
    "aspartylglucosaminuria",
    "autothaumaturgist",
    "baccalaureate",
    "batrachophobia",
    "borborygmus",
    "bougainvillea",
    "bourgeoisie",
    "buckminsterfullerene",
    "bureaucracy",
    "chronopsychophysiology",
    "clinicoechocardiographic",
    "coalworkerspneumoconiosis",
    "compartmentalization",
    "countermajoritarianism",
    "craniosynostosis",
    "cryptoendolithic",
    "dendrochronology",
    "deoxyribonucleic",
    "dichotomization",
    "eclaircissement",
    "electrotelethermometer",
    "entrepreneur",
    "ethopsychopharmacology",
    "flibbertigibbet",
    "fossiliferous",
    "frontoethmoidectomy",
    "gastroenterologist",
    "geitonogamy",
    "geochronostratigraphical",
    "glyceraldehyde",
    "goniosynechialysis",
    "gubernatorial",
    "hemispherectomy",
    "hieroglyphics",
    "hydrochlorofluorocarbon",
    "hypercholesterolemia",
    "hypergammaglobulinemia",
    "hypergonadotropic",
    "hyperpolysyllabic",
    "hypoparathyroidism",
    "imperturbability",
    "incomprehensibility",
    "infinitesimal",
    "infundibulum",
    "institutionalization",
    "iodochlorohydroxyquinoline",
    "jurisprudence",
    "labyrinthine",
    "lepidopterology",
    "machiavellian",
    "mechanotransduction",
    "methemoglobinemia",
    "metonymic",
    "monocotyledonous",
    "morphodifferentiation",
    "necrobiosislipoidica",
    "neuroimmunomodulation",
    "neuropsychological",
    "oligonucleotide",
    "orthogeosyncline",
    "pulchritudinous",
    "quinquagintillion",
    "quoddamodotative"
    "quetzalcoatlus"
    "schistochilaappendiculata", 
    "septicemiccolibacillosis",
    "creeper",
    "garage",
    "larix", 
    "trinity",
    "ampersand",
    "authenticity", 
    "compulsory" 
    "hospital", 
    "hydrangea",
    "noctilucent", 
    "parenthesis"
}
-- Setup GUI
Unpatchabomb.Name = "Unpatchabomb"
local success = pcall(function() Unpatchabomb.Parent = CoreGui end)
if not success then Unpatchabomb.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end
Unpatchabomb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Unpatchabomb.ResetOnSpawn = false

UnpatchabombFrame.Name = "UnpatchabombFrame"
UnpatchabombFrame.Parent = Unpatchabomb
UnpatchabombFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UnpatchabombFrame.BackgroundTransparency = 1.000
UnpatchabombFrame.BorderSizePixel = 0
UnpatchabombFrame.Position = UDim2.new(0, 100, 0, 100)
UnpatchabombFrame.Size = UDim2.new(0, 305, 0, 300)

TopFrame.Name = "TopFrame"
TopFrame.Parent = UnpatchabombFrame
TopFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(1, 0, 0, 28)

T1.Name = "T1"
T1.Parent = TopFrame
T1.BackgroundTransparency = 1.000
T1.Position = UDim2.new(0.01, 0, 0, 0)
T1.Size = UDim2.new(0.25, 0, 1, 0)
T1.Font = Enum.Font.GothamBold
T1.Text = "UNPATCHA"
T1.TextColor3 = Color3.fromRGB(255, 255, 255)
T1.TextSize = 14.000
T1.TextXAlignment = Enum.TextXAlignment.Right

T2.Name = "T2"
T2.Parent = TopFrame
T2.BackgroundTransparency = 1.000
T2.Position = UDim2.new(0.26, 0, 0, 0)
T2.Size = UDim2.new(0.5, 0, 1, 0)
T2.Font = Enum.Font.Gotham
T2.Text = "BOMB (EN)"
T2.TextColor3 = Color3.fromRGB(255, 255, 255)
T2.TextSize = 14.000
T2.TextXAlignment = Enum.TextXAlignment.Left

MainFrame.Name = "MainFrame"
MainFrame.Parent = UnpatchabombFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 0, 0, 28)
MainFrame.Size = UDim2.new(1, 0, 1, -28)

LetterBox.Name = "LetterBox"
LetterBox.Parent = MainFrame
LetterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
LetterBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
LetterBox.BorderSizePixel = 0
LetterBox.Position = UDim2.new(0.02, 0, 0.05, 0)
LetterBox.Size = UDim2.new(0.66, 0, 0.15, 0)
LetterBox.Font = Enum.Font.GothamBold
LetterBox.Text = ""
LetterBox.PlaceholderText = "Letters (Press Enter)"
LetterBox.TextColor3 = Color3.fromRGB(255, 255, 255)
LetterBox.TextSize = 14.000
LetterBox.ClearTextOnFocus = false

AutoBtn.Name = "AutoBtn"
AutoBtn.Parent = MainFrame
AutoBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
AutoBtn.Position = UDim2.new(0.70, 0, 0.05, 0)
AutoBtn.Size = UDim2.new(0.28, 0, 0.15, 0)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "AUTO: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
AutoBtn.TextSize = 12.000

ReloadBtn.Name = "ReloadBtn"
ReloadBtn.Parent = MainFrame
ReloadBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
ReloadBtn.Position = UDim2.new(0.70, 0, 0.23, 0)
ReloadBtn.Size = UDim2.new(0.28, 0, 0.12, 0)
ReloadBtn.Font = Enum.Font.GothamBold
ReloadBtn.Text = "RESET"
ReloadBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
ReloadBtn.TextSize = 12.000

WordText.Name = "WordText"
WordText.Parent = MainFrame
WordText.BackgroundTransparency = 1.000
WordText.Position = UDim2.new(0.02, 0, 0.23, 0)
WordText.Size = UDim2.new(0.66, 0, 0.12, 0)
WordText.Font = Enum.Font.GothamBold
WordText.Text = "Waiting for input..."
WordText.TextColor3 = Color3.fromRGB(255, 255, 255)
WordText.TextSize = 12.000
WordText.TextXAlignment = Enum.TextXAlignment.Left

SuggestionList.Name = "SuggestionList"
SuggestionList.Parent = MainFrame
SuggestionList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SuggestionList.BorderSizePixel = 0
SuggestionList.Position = UDim2.new(0.02, 0, 0.38, 0)
SuggestionList.Size = UDim2.new(0.96, 0, 0.58, 0)
SuggestionList.ScrollBarThickness = 4

ListLayout.Parent = SuggestionList
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 2)

-- Make GUI Draggable
local dragging, dragInput, dragStart, startPos
TopFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = UnpatchabombFrame.Position
    end
end)
TopFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        UnpatchabombFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local IDA_alreadyUsed = {}
local autoGetEnabled = false
local lastQuery = ""

local function ResetUsedWords()
    IDA_alreadyUsed = {}
    WordText.Text = "Loaded " .. #HARDCODED_WORDS .. " words."
    for _, child in ipairs(SuggestionList:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

ReloadBtn.MouseButton1Click:Connect(ResetUsedWords)
ResetUsedWords()

local function IDA_tableItemExists(array, val)
    for i, v in ipairs(array) do
        if v == val then return true end
    end
    return false
end

function updateSuggestions(query)
    query = string.lower(query)
    lastQuery = query
    
    for _, child in ipairs(SuggestionList:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end

    if query == "" then 
        WordText.Text = "Waiting for input..."
        return 
    end

    local matches = {}
    for _, w in ipairs(HARDCODED_WORDS) do
        if string.find(w, query, 1, true) and not IDA_tableItemExists(IDA_alreadyUsed, w) then
            table.insert(matches, w)
        end
    end

    -- Always sort longest words first 
    table.sort(matches, function(a, b) return #a > #b end)

    local ySize = 0
    local limit = math.min(50, #matches)
    
    if limit == 0 then
        WordText.Text = "No valid words found."
        return
    else
        WordText.Text = "Found " .. #matches .. " words"
    end

    for i = 1, limit do
        local word = matches[i]
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 25)
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 12
        btn.Parent = SuggestionList
        btn.RichText = true
        
        -- Highlighting logic
        local startIdx, endIdx = string.find(word, query, 1, true)
        if startIdx then
            local before = string.upper(string.sub(word, 1, startIdx - 1))
            local matchStr = string.upper(string.sub(word, startIdx, endIdx))
            local after = string.upper(string.sub(word, endIdx + 1))
            
            -- Highlights the matching required string in bright green
            btn.Text = before .. '<font color="rgb(0, 255, 100)"><u>' .. matchStr .. '</u></font>' .. after .. " (" .. #word .. ")"
        else
            btn.Text = string.upper(word) .. " (" .. #word .. ")"
        end
        
        btn.MouseButton1Click:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            btn.Text = "COPIED TO CLIPBOARD!"
            table.insert(IDA_alreadyUsed, word)
            
            -- Copies to clipboard when clicked
            pcall(function() setclipboard(word) end)
            
            task.delay(0.5, function()
                if btn.Parent then btn:Destroy() end
            end)
        end)
        
        ySize = ySize + 27
    end
    
    SuggestionList.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

LetterBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local sanitized = string.gsub(LetterBox.Text, "%s+", "")
        updateSuggestions(sanitized)
    end
end)

-----------------------------------
-- AUTO GET LETTER LOGIC
-----------------------------------
AutoBtn.MouseButton1Click:Connect(function()
    autoGetEnabled = not autoGetEnabled
    if autoGetEnabled then
        AutoBtn.Text = "AUTO: ON"
        AutoBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        AutoBtn.Text = "AUTO: OFF"
        AutoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

local function GetGameLetters()
    local text = ""
    pcall(function()
        text = workspace.Map.Parts.Monitor.Main.SurfaceGui.BottomText.Text
    end)
    return text
end

task.spawn(function()
    while task.wait(0.3) do
        if autoGetEnabled then
            local newLetters = GetGameLetters()
            newLetters = string.gsub(newLetters, "%s+", "") 
            
            if newLetters ~= "" and string.lower(newLetters) ~= string.lower(lastQuery) then
                LetterBox.Text = newLetters
                updateSuggestions(newLetters)
            end
        end
    end
end)

