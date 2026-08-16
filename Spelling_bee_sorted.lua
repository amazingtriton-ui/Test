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
"aim",
"air",
"heir",
"baby",
"bad",
"bag",
"ball",
"bar",
"bat",
"bed",
"be",
"bee",
"best",
"big",
"bird",
"blue",
"blew",
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
"duck",
"door",
"eat",
"egg",
"elf",
"end",
"eye",
"aye",
"face",
"fire",
"fish",
"phish",
"five",
"food",
"foot",
"four",
"for",
"fore",
"go",
"gold",
"hand",
"hat",
"ink",
"job",
"jog",
"kiss",
"lip",
"milk",
"mix",
"mom",
"moon",
"mug",
"newb",
"noob",
"one",
"won",
"owl",
"pan",
"pi",
"pie",
"pink",
"rain",
"reign",
"rein",
"rat",
"read",
"ruby",
"run",
"sit",
"size",
"sighs",
"snow",
"soda",
"star",
"suck",
"son",
"sun",
"stop",
"tag",
"tank",
"tap",
"three",
"town",
"tree",
"try",
"two",
"too",
"to",
"water",
"wind",
"word",
"whirred",
"wow",
"zoo",
"absorb",
"angel",
"ash",
"bark",
"basket",
"been",
"bean",
"bingo",
"black",
"bomb",
"born",
"boss",
"brain",
"bred",
"bread",
"brown",
"bunny",
"burger",
"burial",
"cabin",
"castle",
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
"daemon",
"echo",
"emoji",
"erupt",
"exert",
"exile",
"film",
"filter",
"flower",
"flour",
"foggy",
"forbid",
"fry",
"gender",
"ghost",
"giant",
"greedy",
"green",
"grub",
"hello",
"hair",
"hare",
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
"nobel",
"orange",
"park",
"pasta",
"pear",
"pair",
"power",
"prank",
"pray",
"prey",
"proof",
"quack",
"queen",
"quill",
"rally",
"random",
"reply",
"robust",
"rot",
"wrought",
"seed",
"shake",
"shark",
"sigh",
"psi",
"sock",
"spring",
"state",
"stem",
"stew",
"still",
"stumble",
"trauma",
"twin",
"twist",
"update",
"vein",
"vain",
"walk",
"way",
"weigh",
"white",
"workout",
"wrist",
"zone",
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
"armour",
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
"catalogue",
"center",
"centre",
"chicken",
"chronic",
"church",
"congratulate",
"cooking",
"creeper",
"curious",
"daffodil",
"damage",
"debris",
"decimal",
"diesel",
"dilate",
"dolphin",
"enact",
"excellent",
"familiar",
"firefighter",
"flavor",
"flavour",
"formidable",
"frolic",
"furious",
"gallant",
"garage",
"gradual",
"growl",
"guideline",
"harbor",
"harbour",
"heresy",
"immobilise",
"immobilize",
"integrity",
"ionise",
"ionise",
"jaded",
"lactose",
"larix",
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
"overdo",
"paradox",
"password",
"pigeon",
"pidgin",
"plethora",
"powder",
"present",
"probably",
"pulsar",
"pumpkin",
"pursuit",
"purple",
"recipient",
"refrain",
"refugee",
"remarkable",
"rye",
"wry",
"rooster",
"scrutiny",
"secret",
"seldom",
"semicircle",
"shoulder",
"sigma",
"sleigh",
"slay",
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
"trinity",
"twenty",
"uncomfortable",
"understand",
"vague",
"villain",
"voluntary",
"walnut",
"warrior",
"window",
"youthful",
"zombie",
"abditive",
"abdomen",
"abhorrent",
"abscond",
"accomplishment",
"accommodate",
"accumulation",
"adolescent",
"adversity",
"aegis",
"aerodynamic",
"agriculture",
"ampersand",
"analeptic",
"apostrophe",
"arcane",
"articulate",
"aspiration",
"assumption",
"asunder",
"asthma",
"atmospheric",
"authenticity",
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
"celebration",
"champagne",
"charisma",
"chlorophyll",
"christmas",
"clowder",
"cognitive",
"colonel",
"kernel",
"combustible",
"commemorate",
"commodity",
"compulsory",
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
"endeavour",
"environmental",
"epiphany",
"epsilon",
"erratic",
"ethereal",
"euphoria",
"exaggerate",
"excalibur",
"exorcism",
"expectation",
"expenditure",
"exponential",
"extravagant",
"fantasy",
"favorable",
"favourable",
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
"hospital",
"hourglass",
"humanitarian",
"hydrangea",
"hypocritical",
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
"juxtaposition",
"kangaroo",
"languid",
"legendary",
"limousine",
"livery",
"limina",
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
"neighbouring",
"noctilucent",
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
"parenthesis",
"participation",
"passionate",
"peppermint",
"periodically",
"personnel",
"pestilence",
"phenomenon",
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
"sashay",
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
"abacaxi",
"abasia",
"acculturate",
"aforementioned",
"aggrandise",
"aggrandize",
"agoraphobia",
"agoraphobic",
"altruistic",
"ambidextrous",
"ambiguous",
"amylosucrase",
"anaphylactic",
"anemone",
"anisosquaric",
"apocryphal",
"apothecary",
"asphyxiation",
"asthenosphere",
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
"elision",
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
"foraminotomy",
"fuchsia",
"garrulous",
"gentrification",
"glaucomatous",
"glockenspiel",
"gobbledegook",
"gobbledygook",
"grandiloquent",
"grimoire",
"handkerchief",
"harpsichord",
"hemoglobin",
"haemoglobin",
"heterozygous",
"hierarchy",
"homeopathy",
"homoeopathy",
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
"isometropia",
"isthmus",
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
"microminiaturisation",
"microminiaturization",
"milieu",
"miniscule",
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
"nocturn",
"nocturne",
"nomenclature",
"noumenon",
"nutritious",
"obfuscation",
"occhiolism",
"onomatopoeia",
"onychophagia",
"paradigm",
"parliamentary",
"paroxysm",
"pecuniary",
"percipient",
"perfidious",
"peristerophily",
"pernicious",
"pessimistic",
"phantasmagoria",
"pharaoh",
"farrow",
"phlegm",
"photogeochemistry",
"photosynthesis",
"pirouette",
"pneumatic",
"polemic",
"polychromatic",
"polydactyly",
"polymerisation",
"polymerization",
"predecessor",
"prestigious",
"psychological",
"puerile",
"pugnacious",
"pycnidium",
"querimony",
"quixotry",
"radiometeorograph",
"rambunctious",
"rehabilitation",
"reminiscence",
"rendezvous",
"sagacious",
"sanguine",
"sarcophagus",
"schizophrenic",
"scintillate",
"semaphore",
"sententiously",
"sequacious",
"sequoia",
"silhouette",
"simultaneous",
"soliloquy",
"sovereignty",
"subpoena",
"subterranean",
"supercentenarian",
"supersede",
"supercede",
"syllepsis",
"symbiosis",
"syzygy",
"tempestuous",
"tetraphobia",
"therapeutic",
"thermionic",
"thermoluminescence",
"triphosphate",
"tumultuous",
"ubiquitous",
"uncharacteristic",
"unintelligible",
"verbatim",
"vexatious",
"vignette",
"xenogeneic",
"zephyr",
"zygote",
"abdominothoracic",
"absquatulate",
"acetaminophen",
"achromatophil",
"achromatophilia",
"acquiesce",
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
"bougainvillia",
"bougainvillea",
"bourgeoisie",
"buckminsterfullerene",
"bureaucracy",
"chronopsychophysiology",
"clinicoechocardiographic",
"coalworkerspneumoconiosis",
"compartmentalisation",
"compartmentalization",
"countermajoritarianism",
"craniosynostosis",
"cryptoendolithic",
"dendrochronology",
"deoxyribonucleic",
"dichotomisation",
"dichotomization",
"eclaircissement",
"effervescent",
"electronystagmography",
"electrotelethermometer",
"entrepreneur",
"ethnopsychopharmacology",
"ferroequinologist",
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
"hyaluronoglucuronidase",
"hydrochlorofluorocarbon",
"hypercholesterolemia",
"hypergammaglobulinemia",
"hypergammaglobulinaemia",
"hypergonadotropic",
"hyperpolysyllabic",
"hypoparathyroidism",
"imperturbability",
"incomprehensibility",
"infinitesimal",
"infundibulum",
"institutionalisation",
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
"panproctocolectomy",
"parallelogrammatic",
"paraphernalia",
"perspicacious",
"photoreconnaissance",
"plasmodiumfalciparum",
"plenipotentiary",
"portmanteau",
"prestidigitation",
"proceleusmatic",
"prognostication",
"pseudohyperaldosteronism",
"pseudoparallelodromous",
"pseudoriemannian",
"psychoneuroimmunology",
"psychopharmacotherapy",
"psychotomimetic",
"pulchritudinous",
"pusillanimous",
"quasiautobiographical",
"quasquicentennial",
"quetzalcoatlus",
"quindecasyllabic",
"quinquagintillion",
"quoddamodotative",
"radioallergosorbent",
"rhinorrhagia",
"schistochilaappendiculata",
"septicemiccolibacillosis",
"serendipity",
"sesquipedalian",
"spectrophotometer",
"subcompartmentalisation",
"subcompartmentalization",
"subdermatoglyphic",
"supererogatory",
"superferromagnetism",
"susurration",
"temporomandibular",
"thalassophobia",
"thermochromatography",
"tintinnabulation",
"transinstitutionalisation",
"transinstitutionalization",
"trinitrotoluene",
"utilitarianism",
"verisimilitude",
"worcestershire",
"xanthogranulomatous",
"xiphiplastron",
"xylotypographic",
"acetylglucocoroglaucigenin",
"acrocephalopolydactylousdysplasia",
"adrenocorticotrophin",
"adrenocorticotropin",
"anthropomorphisation",
"anthropomorphization",
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
"dextrodeorsumversion",
"dichlorodiphenyltrichloroethane",
"diisopropylfluorophosphate",
"dermatofibrosislenticularisdisseminata",
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
"gegenstandstheorie",
"hematospectrophotometrically",
"haematospectrophotometrically",
"hexakosioihexekontahexaphobia",
"hexanitrohexaazatricyclododecanedione",
"hippopotomonstrosesquipedaliophobia",
"hippopotomonstrosesquippedaliophobia",
"honorificabilitudinity",
"honourificabilitudinity",
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
"paroxysmalnocturnalhaemoglobinuria",
"percutaneousendoscopicgastrostomy",
"photoplethysmography",
"phosphorodiamidatemorpholinooligomer",
"pneumoencephalography",
"pneumonoultramicroscopicsilicovolcanoconiosis",
"polyphiloprogenitive",
"pseudopseudohypoparathyroidism",
"pseudorhombicuboctahedron",
"psychoneuroendocrinological",
"psychophysicotherapeutics",
"pyrrolizidinealkaloidosis",
"reninangiotensinaldosterone",
"ribulosebisphosphatecarboxylaseoxygenase",
"scaphotrapeziotrapezoidosteoarthritis",
"sclerectoiridectomy",
"spectrophotofluorometry",
"sphenopalatineganglioneuralgia",
"sphygmomanometer",
"stereoelectroencephalography",
"supercalifragilisticexpialidocious",
"thymicstromallymphopoietin",
"thyroparathyroidectomy",
"tonsillopharyngitis",
"uridinediphosphateglycosyltransferase",
"uvulopalatopharyngoplasty",
"ventriculocisternostomy",
"xanthogranulomatouspyelonephritis",
"zoanthroprosopometamorphopsia"
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

