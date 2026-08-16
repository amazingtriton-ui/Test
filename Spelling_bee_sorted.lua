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
local PlusBtn = Instance.new("TextButton")
local MinusBtn = Instance.new("TextButton")
local GuiScale = Instance.new("UIScale")

-- Hardcoded Dictionary
local HARDCODED_WORDS = {
    "electronystagmography",
    "amylosucrase",
    "youthful",
    "born",
    "wow",
    "hexanitrohexaazatricyclododecanedione",
    "ferroequinologist",
    "peristerophily",
    "hypocritical",
    "shoulder",
    "zone",
    "owl",
    "parliamentary",
    "paroxysm",
    "perfidious",
    "pernicious",
    "pessimistic",
    "pharaoh",
    "phlegm",
    "pirouette",
    "psychological",
    "radiometeorograph",
    "rambunctious",
    "rendezvous",
    "scintillate",
    "sequoia",
    "sequacious",
    "simultaneous",
    "sovereignty",
    "subterranean",
    "supercentenarian",
    "syllepsis",
    "syzygy",
    "unintelligible",
    "vexatious",
    "xenogeneic",
    "abacaxi",
    "abasia",
    "abditive",
    "abdomen",
    "abdominothoracic",
    "abhorrent",
    "abolish",
    "abscond",
    "absence",
    "absorb",
    "absquatulate",
    "abstract",
    "accommodate",
    "accomplishment",
    "acculturate",
    "accumulation",
    "acetaminophen",
    "acetylglucocoroglaucigenin",
    "achromatophil",
    "achromatophilia",
    "acquiesce",
    "acrocephalopolydactylousdysplasia",
    "adolescent",
    "adrenocorticotrophin",
    "adversity",
    "aegis",
    "aerodynamic",
    "aforementioned",
    "agaric",
    "aggrandize",
    "agnostic",
    "agoraphobia",
    "agoraphobic",
    "agriculture",
    "aim",
    "air",
    "akin",
    "albeit",
    "alliance",
    "allotransplantation",
    "alphabet",
    "altruistic",
    "ambidextrous",
    "ambiguous",
    "ampersand",
    "anachronistic",
    "analeptic",
    "anaphylactic",
    "anatomical",
    "anemone",
    "aneurysmorrhaphy",
    "angel",
    "anisosquaric",
    "answer",
    "antediluvian",
    "anthropomorphisation",
    "antidisestablishmentarianism",
    "antixerophthalmic",
    "apocryphal",
    "apostrophe",
    "apothecary",
    "appetite",
    "arcane",
    "armor",
    "arthroereisis",
    "articulate",
    "ascosporogenous",
    "ash",
    "aspartylglucosaminuria",
    "asphyxiation",
    "aspiration",
    "assumption",
    "asthenosphere",
    "asthma",
    "astigmatism",
    "asunder",
    "ataraxy",
    "atmospheric",
    "atone",
    "attorney",
    "authenticity",
    "automatic",
    "autothaumaturgist",
    "await",
    "baby",
    "baccalaureate",
    "bad",
    "bag",
    "ball",
    "bamboo",
    "bandeau",
    "bar",
    "bark",
    "basket",
    "bat",
    "batrachophobia",
    "bayonet",
    "beach",
    "bean",
    "bed",
    "bee",
    "belvedere",
    "beneficiary",
    "benevolence",
    "best",
    "betray",
    "betwixt",
    "big",
    "bingo",
    "biography",
    "bird",
    "bizarre",
    "black",
    "blatherskite",
    "blizzard",
    "blossom",
    "blue",
    "bodacious",
    "bogolanfini",
    "bomb",
    "book",
    "borborygmus",
    "boss",
    "bougainvillea",
    "bourgeoisie",
    "bourgeoisification",
    "brain",
    "bread",
    "breakthrough",
    "broccoli",
    "bromochlorodifluoromethane",
    "bronchitis",
    "brown",
    "brucellosis",
    "brusque",
    "buckminsterfullerene",
    "bucolic",
    "bug",
    "bunny",
    "bureaucracy",
    "burger",
    "burial",
    "bus",
    "cabin",
    "cacophony",
    "cake",
    "calamitous",
    "calibration",
    "callow",
    "calumny",
    "canaliculodacryocystorhinostomy",
    "candlelight",
    "capoeira",
    "capricious",
    "captious",
    "car",
    "castle",
    "cat",
    "catalog",
    "caustic",
    "center",
    "cerulean",
    "champagne",
    "charcuterie",
    "chargoggagoggmanchauggagoggchaubunagungamaugg",
    "charisma",
    "chauffeur",
    "chicken",
    "chlorophyll",
    "cholangiocholecystocholedochectomy",
    "cholangiopancreatography",
    "chondromyxohemangioendotheliosarcoma",
    "christmas",
    "chronic",
    "chronological",
    "chronopsychophysiology",
    "church",
    "cinematographer",
    "circle",
    "clairvoyant",
    "clandestine",
    "clever",
    "cliff",
    "clinicoechocardiographic",
    "clock",
    "clowder",
    "clutch",
    "coalescence",
    "coalworkerspneumoconiosis",
    "codicil",
    "cognitive",
    "colloquialism",
    "colonel",
    "combustible",
    "comeuppance",
    "commemorate",
    "commodity",
    "commodore",
    "compartmentalization",
    "comply",
    "compulsory",
    "compunction",
    "concentration",
    "congenitalnasalmeningoencephalocele",
    "congratulate",
    "congregation",
    "consanguine",
    "consummate",
    "consumption",
    "contour",
    "contradistinguish",
    "controversial",
    "convey",
    "convivial",
    "convolvulaceous",
    "cooking",
    "cool",
    "correspondence",
    "corticopontocerebellar",
    "corynebacteriumpseudotuberculosis",
    "counterimmunoelectrophoresis",
    "counterintuitive",
    "countermajoritarianism",
    "cow",
    "craniosynostosis",
    "creeper",
    "crowd",
    "cry",
    "cryptoendolithic",
    "cuisine",
    "culvert",
    "cup",
    "curious",
    "cyrillic",
    "dad",
    "daffodil",
    "dairy",
    "damage",
    "dauntless",
    "debris",
    "defenestration",
    "defy",
    "dehydrothiotoluidine",
    "deleterious",
    "demon",
    "dendrochronology",
    "deoxyribonucleic",
    "depilatory",
    "deployment",
    "dermatofibrosarcomaprotuberans",
    "dermatofibrosislenticularisdisseminata",
    "derogatory",
    "detrimental",
    "dextrodeorsumversion",
    "dichlorodiphenyltrichloroethane",
    "dichotomization",
    "diesel",
    "differentiation",
    "diisopropylfluorophosphate",
    "dilate",
    "dimethyldioctadecylammoniumchloride",
    "diminution",
    "diplomatic",
    "disappointment",
    "discombobulate",
    "disconsolate",
    "division",
    "doctrine",
    "dodecahedron",
    "dog",
    "dolphin",
    "door",
    "duck",
    "eat",
    "ebullition",
    "echo",
    "eclaircissement",
    "eellogofusciouhipoppokunurious",
    "effervescent",
    "egg",
    "elaborate",
    "electrotelethermometer",
    "elf",
    "eloquent",
    "elysian",
    "embarrassment",
    "embassy",
    "emoji",
    "enact",
    "encephalocraniocutaneouslipomatosis",
    "enchantment",
    "encore",
    "end",
    "endeavor",
    "ennui",
    "entrepreneur",
    "environmental",
    "epiphany",
    "epitome",
    "epsilon",
    "erratic",
    "erroneous",
    "erudition",
    "erupt",
    "erythrocytapheresis",
    "esophagogastroduodenoscopy",
    "esurient",
    "ethereal",
    "ethnomethodology",
    "ethopsychopharmacology",
    "euphoria",
    "evanesce",
    "exaggerate",
    "excalibur",
    "excellent",
    "exert",
    "exile",
    "exorcism",
    "expenditure",
    "exponential",
    "extraterrestrial",
    "extravagant",
    "eye",
    "face",
    "facsimile",
    "familiar",
    "fantasy",
    "fastidious",
    "favorable",
    "featherweight",
    "ferriprotoporphyrin",
    "fictitious",
    "film",
    "filter",
    "fire",
    "firefighter",
    "fish",
    "fissiparous",
    "five",
    "fjord",
    "flamboyant",
    "flavor",
    "flibbertigibbet",
    "floccinaucinihilipilification",
    "flower",
    "flummox",
    "fluorescent",
    "fluorotetraferriphlogopite",
    "foggy",
    "foible",
    "folliculitis",
    "food",
    "foot",
    "forbid",
    "formidable",
    "forthcoming",
    "fossiliferous",
    "four",
    "frolic",
    "frontoethmoidectomy",
    "frostbite",
    "fructosebisphosphatetriosephosphatelyase",
    "fruition",
    "fry",
    "fuchsia",
    "fugacious",
    "funkenzwangsvorstellung",
    "furious",
    "gallant",
    "garage",
    "garrulous",
    "gastrocnemiosemimembranous",
    "gastroenterologist",
    "gastronomic",
    "gazebo",
    "gegenstandstheorie",
    "geitonogamy",
    "gender",
    "gentrification",
    "geochronostratigraphical",
    "germination",
    "ghost",
    "giant",
    "gibberish",
    "gingerbread",
    "glacier",
    "glaucomatous",
    "glockenspiel",
    "glyceraldehyde",
    "go",
    "gobbledygook",
    "gold",
    "goniosynechialysis",
    "gradual",
    "grandiloquent",
    "gratitude",
    "gravestone",
    "greedy",
    "green",
    "growl",
    "grub",
    "gubernatorial",
    "guideline",
    "hailstone",
    "hair",
    "hand",
    "handkerchief",
    "harbor",
    "harpsichord",
    "hat",
    "hello",
    "hematospectrophotometrically",
    "hemispherectomy",
    "hemoglobin",
    "heresy",
    "heritage",
    "heterozygous",
    "hexagonal",
    "hexakosioihexekontahexaphobia",
    "hibernation",
    "hierarchy",
    "hieroglyphics",
    "hippopotomonstrosesquippedaliophobia",
    "homeopathy",
    "homogeneous",
    "honourificabilitudinity",
    "hornswoggle",
    "horticulturist",
    "hospital",
    "hotel",
    "hourglass",
    "house",
    "human",
    "humanitarian",
    "hungry",
    "hunt",
    "hyaluronoglucuronidase",
    "hydrangea",
    "hydrochlorofluorocarbon",
    "hypercholesterolemia",
    "hypergammaglobulinemia",
    "hypergonadotropic",
    "hypermetropia",
    "hyperpolysyllabic",
    "hypoparathyroidism",
    "hypothalamicpituitaryadrenocortical",
    "hypothesis",
    "iconoclast",
    "ideological",
    "idiom",
    "idiosyncratic",
    "imminent",
    "immobilize",
    "immunoelectrochemiluminescence",
    "imperturbability",
    "imprisonment",
    "incandescent",
    "inchoate",
    "incoagulable",
    "incomprehensibility",
    "indefatigable",
    "independence",
    "indifference",
    "infinitesimal",
    "infundibulum",
    "ingenious",
    "inhabitant",
    "ink",
    "inositolphosphorylceramide",
    "insinuate",
    "insipid",
    "institutionalization",
    "integration",
    "integrity",
    "intent",
    "intermediate",
    "intermission",
    "introspect",
    "iodochlorohydroxyquinoline",
    "ionize",
    "irascible",
    "iron",
    "irony",
    "isometropia",
    "isthmus",
    "jaded",
    "job",
    "jog",
    "jurisprudence",
    "juxtaposition",
    "kaleidoscope",
    "kangaroo",
    "kiss",
    "labyrinthine",
    "lachrymose",
    "lactose",
    "lake",
    "land",
    "languid",
    "laparohysterosalpingooophorectomy",
    "larix",
    "laryngotracheobronchitis",
    "larynx",
    "lather",
    "latitudinarian",
    "latitudinarianism",
    "leafy",
    "legendary",
    "legislation",
    "length",
    "lepidopterology",
    "lexicography",
    "liable",
    "liaison",
    "lightning",
    "limina",
    "limousine",
    "lip",
    "livery",
    "loncastuximabtesirine",
    "loquacious",
    "lugubrious",
    "lymphangiography",
    "lymphangioleiomyomatosis",
    "macabre",
    "machiavellian",
    "magnificent",
    "magniloquent",
    "malapropism",
    "margin",
    "martyrdom",
    "mathematician",
    "mechanotransduction",
    "meditate",
    "melancholy",
    "mellifluous",
    "melt",
    "menagerie",
    "mendacious",
    "meow",
    "meretricious",
    "metabolism",
    "metempsychosis",
    "methemoglobinemia",
    "methodology",
    "metonymic",
    "microminiaturization",
    "microorganism",
    "micropachycephalosaurus",
    "milieu",
    "milk",
    "minuscule",
    "miscellaneous",
    "misconception",
    "mistletoe",
    "mix",
    "mom",
    "monk",
    "monochromatic",
    "monocotyledonous",
    "monosyllabic",
    "moon",
    "morphodifferentiation",
    "mug",
    "multidimensionality",
    "multiplication",
    "municipal",
    "myopic",
    "myriad",
    "narcissistic",
    "nauseous",
    "nebulous",
    "necrobiosislipoidica",
    "necromancer",
    "negotiation",
    "neighboring",
    "neohesperidindihydrochalcone",
    "neophyte",
    "nest",
    "neuroimmunomodulation",
    "neuroplasticity",
    "neuropsychological",
    "nincompoop",
    "noble",
    "noctilucent",
    "nocturne",
    "nomenclature",
    "nonanonacontanonactanonaliagon",
    "nonplussed",
    "noob",
    "normal",
    "notorious",
    "noumenon",
    "nucleotidylexotransferase",
    "nutritious",
    "oasis",
    "obesity",
    "obfuscation",
    "obituary",
    "oblivious",
    "occhiolism",
    "offender",
    "oligonucleotide",
    "one",
    "onomatopoeia",
    "onychophagia",
    "opaque",
    "optimism",
    "orange",
    "orotatephosphoribosyltransferase",
    "orthogeosyncline",
    "otorhinolaryngological",
    "overdue",
    "palatine",
    "pan",
    "pantograph",
    "paradise",
    "paradox",
    "paragon",
    "parallel",
    "parallelogrammatic",
    "paraphernalia",
    "parenthesis",
    "park",
    "paroxysmalnocturnalhemoglobinuria",
    "participation",
    "passionate",
    "password",
    "pasta",
    "pear",
    "peppermint",
    "percipient",
    "percutaneousendoscopicgastrostomy",
    "periodically",
    "personnel",
    "perspicacious",
    "pestilence",
    "phantasmagoria",
    "phosphorodiamidatemorpholinooligomer",
    "photogeochemistry",
    "photographer",
    "photoplethysmography",
    "pie",
    "pigeon",
    "pink",
    "plasmodiumfalciparum",
    "plenipotentiary",
    "plethora",
    "pneumoencephalography",
    "pneumonoultramicroscopicsilicovolcanoconiosis",
    "polychromatic",
    "polyphiloprogenitive",
    "pomegranate",
    "portfolio",
    "portmanteau",
    "powder",
    "power",
    "practitioner",
    "prank",
    "pray",
    "predominantly",
    "present",
    "prestidigitation",
    "probably",
    "problematic",
    "proclamation",
    "procrastinate",
    "prognostication",
    "pronunciation",
    "proof",
    "propaganda",
    "protocol",
    "pseudohyperaldosteronism",
    "pseudoparallelodromous",
    "pseudopseudohypoparathyroidism",
    "pseudorhombicuboctahedron",
    "pseudoriemannian",
    "psychoneuroendocrinological",
    "psychopharmacotherapy",
    "psychophysicotherapeutics",
    "psychotomimetic",
    "pulchritudinous",
    "pulsar",
    "pumpkin",
    "pursuit",
    "pusillanimous",
    "pygmy",
    "pyrrolizidinealkaloidosis",
    "quack",
    "quasiautobiographical",
    "quasquicentennial",
    "queen",
    "querimony",
    "quetzalcoatlus",
    "quill",
    "quindecasyllabic",
    "quinquagintillion",
    "quoddamodotative",
    "radioallergosorbent",
    "rain",
    "rally",
    "random",
    "rat",
    "ravenous",
    "recession",
    "recipient",
    "red",
    "refrain",
    "refugee",
    "rehabilitation",
    "reincarnation",
    "reliability",
    "remarkable",
    "reminiscence",
    "reply",
    "residential",
    "resilience",
    "resurrection",
    "revelation",
    "rhinorrhagia",
    "rhythm",
    "ribulosebisphosphatecarboxylaseoxygenase",
    "ricochet",
    "robust",
    "rooster",
    "rot",
    "ruby",
    "run",
    "rye",
    "sabotage",
    "sachet",
    "sapphire",
    "sarcophagus",
    "scaphotrapeziotrapezoidosteoarthritis",
    "schistochilaappendiculata",
    "scholarship",
    "sclerectoiridectomy",
    "scrutiny",
    "scythe",
    "secret",
    "seed",
    "seldom",
    "semicircle",
    "sentimental",
    "separation",
    "septicemiccolibacillosis",
    "serendipity",
    "sesquipedalian",
    "shake",
    "shareholder",
    "shark",
    "sigh",
    "sigma",
    "significance",
    "sit",
    "size",
    "skeleton",
    "sleigh",
    "sniffle",
    "snow",
    "snowflake",
    "sock",
    "soda",
    "solidarity",
    "special",
    "spectrophotofluorometry",
    "spectrophotometer",
    "sphenopalatineganglioneuralgia",
    "sphygmomanometer",
    "spokesperson",
    "spooky",
    "spring",
    "star",
    "state",
    "steadfast",
    "stem",
    "stereoelectroencephalography",
    "stereotype",
    "stew",
    "still",
    "stop",
    "strategic",
    "stumble",
    "subcompartmentalization",
    "subdermatoglyphic",
    "subsidy",
    "suck",
    "sun",
    "sunflower",
    "supercalifragilisticexpialidocious",
    "supererogatory",
    "superferromagnetism",
    "supposedly",
    "surrogate",
    "surveillance",
    "susceptible",
    "susurration",
    "swamp",
    "syllable",
    "symmetrical",
    "syntax",
    "systematic",
    "tag",
    "tangerine",
    "tank",
    "tap",
    "technological",
    "telepathy",
    "temporomandibular",
    "tetraphobia",
    "thalassophobia",
    "thermochromatography",
    "thesaurus",
    "thesis",
    "three",
    "thymicstromallymphopoietin",
    "thyroparathyroidectomy",
    "tintinnabulation",
    "tonsillopharyngitis",
    "town",
    "transaction",
    "transinstitutionalization",
    "translucent",
    "transparency",
    "transportation",
    "trauma",
    "tree",
    "tremendous",
    "trinitrotoluene",
    "trinity",
    "try",
    "twenty",
    "twin",
    "twist",
    "two",
    "uncharacteristic",
    "uncomfortable",
    "understand",
    "unprecedented",
    "update",
    "uridinediphosphateglycosyltransferase",
    "utilitarianism",
    "uvulopalatopharyngoplasty",
    "vague",
    "validity",
    "vein",
    "venerate",
    "ventriculocisternostomy",
    "verisimilitude",
    "villain",
    "violation",
    "voluntary",
    "vulnerability",
    "walk",
    "walnut",
    "warrior",
    "water",
    "way",
    "wednesday",
    "white",
    "wholeheartedly",
    "wind",
    "window",
    "worcestershire",
    "word",
    "workout",
    "worthwhile",
    "wrist",
    "xanthogranulomatous",
    "xanthogranulomatouspyelonephritis",
    "xiphiplastron",
    "xylotypographic",
    "zoanthroprosopometamorphopsia",
    "zombie",
    "zoo",
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
-- Setup GUI Scaling
GuiScale.Parent = UnpatchabombFrame
GuiScale.Scale = 1.0

MinusBtn.Name = "MinusBtn"
MinusBtn.Parent = TopFrame
MinusBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
MinusBtn.BorderSizePixel = 0
MinusBtn.Position = UDim2.new(1, -56, 0, 0)
MinusBtn.Size = UDim2.new(0, 28, 0, 28)
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.Text = "-"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.TextSize = 18

PlusBtn.Name = "PlusBtn"
PlusBtn.Parent = TopFrame
PlusBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
PlusBtn.BorderSizePixel = 0
PlusBtn.Position = UDim2.new(1, -28, 0, 0)
PlusBtn.Size = UDim2.new(0, 28, 0, 28)
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.TextSize = 18

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

-- Size Modification Logic
local currentScale = 1.0
local MAX_SCALE = 4.0
local MIN_SCALE = 0.25
local SCALE_STEP = 0.25

PlusBtn.MouseButton1Click:Connect(function()
    if currentScale < MAX_SCALE then
        currentScale = math.min(MAX_SCALE, currentScale + SCALE_STEP)
        GuiScale.Scale = currentScale
    end
end)

MinusBtn.MouseButton1Click:Connect(function()
    if currentScale > MIN_SCALE then
        currentScale = math.max(MIN_SCALE, currentScale - SCALE_STEP)
        GuiScale.Scale = currentScale
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

