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
"Aim",
"Air",
"Heir",
"Baby",
"Bad",
"Bag",
"Ball",
"Bar",
"Bat",
"Bed",
"Be",
"Bee",
"Best",
"Big",
"Bird",
"Blue",
"Blew",
"Book",
"Bug",
"Bus",
"Cake",
"Car",
"Cat",
"Cool",
"Cow",
"Cry",
"Cup",
"Dad",
"Dog",
"Duck",
"Door",
"Eat",
"Egg",
"Elf",
"End",
"Eye",
"Aye",
"Face",
"Fire",
"Fish",
"Phish",
"Five",
"Food",
"Foot",
"Four",
"For",
"Fore",
"Go",
"Gold",
"Hand",
"Hat",
"Ink",
"Job",
"Jog",
"Kiss",
"Lip",
"Milk",
"Mix",
"Mom",
"Moon",
"Mug",
"Newb",
"Noob",
"One",
"Won",
"Owl",
"Pan",
"Pi",
"pie",
"Pink",
"Rain",
"Reign",
"Rein",
"Rat",
"Read",
"Ruby",
"Run",
"Sit",
"Size",
"Sighs",
"Snow",
"Soda",
"Star",
"Suck",
"Son",
"Sun",
"Stop",
"Tag",
"Tank",
"Tap",
"Three",
"Town",
"Tree",
"Try",
"Two",
"Too",
"To",
"Water",
"Wind",
"Word",
"Whirred",
"Wow",
"Zoo",
"Absorb",
"Angel",
"Ash",
"Bark",
"Basket",
"Been",
"Bean",
"Bingo",
"Black",
"Bomb",
"Born",
"Boss",
"Brain",
"Bred",
"Bread",
"Brown",
"Bunny",
"Burger",
"Burial",
"Cabin",
"Castle",
"Circle",
"Clever",
"Cliff",
"Clock",
"Clutch",
"Comply",
"Convey",
"Crowd",
"Dairy",
"Defy",
"Demon",
"Daemon",
"Echo",
"Emoji",
"Erupt",
"Exert",
"Exile",
"Film",
"Filter",
"Flower",
"Flour",
"Foggy",
"Forbid",
"Fry",
"Gender",
"Ghost",
"Giant",
"Greedy",
"Green",
"Grub",
"Hello",
"Hair",
"Hare",
"Hotel",
"House",
"Human",
"Hunt",
"Hungry",
"Intent",
"Iron",
"Irony",
"Lake",
"Land",
"Length",
"Margin",
"Melt",
"Meow",
"Monk",
"Nest",
"Noble",
"Nobel",
"Orange",
"Park",
"Pasta",
"Pear",
"Pair",
"Power",
"Prank",
"Pray",
"Prey",
"Proof",
"Quack",
"Queen",
"Quill",
"Rally",
"Random",
"Reply",
"Robust",
"Rot",
"Wrought",
"Seed",
"Shake",
"Shark",
"Sigh",
"Psi",
"Sock",
"Spring",
"State",
"Stem",
"Stew",
"Still",
"Stumble",
"Trauma",
"Twin",
"Twist",
"Update",
"Vein",
"Vain",
"Walk",
"Way",
"Weigh",
"White",
"Workout",
"Wrist",
"Zone",
"Abolish",
"Absence",
"Abstract",
"Agaric",
"Agnostic",
"Akin",
"Albeit",
"Alliance",
"Alphabet",
"Anatomical",
"Answer",
"Appetite",
"Armor",
"Armour",
"Atone",
"Automatic",
"Await",
"Bamboo",
"Bayonet",
"Beach",
"Betray",
"Biography",
"Bizarre",
"Breakthrough",
"Broccoli",
"Catalog",
"Catalogue",
"Center",
"Centre",
"Chicken",
"Chronic",
"Church",
"Congratulate",
"Cooking",
"Creeper",
"Curious",
"Daffodil",
"Damage",
"Debris",
"Decimal",
"Diesel",
"Dilate",
"Dolphin",
"Enact",
"Excellent",
"Familiar",
"Firefighter",
"Flavor",
"Flavour",
"Formidable",
"Frolic",
"Furious",
"Gallant",
"Garage",
"Gradual",
"Growl",
"Guideline",
"Harbor",
"Harbour",
"Heresy",
"Immobilise",
"Immobilize",
"Integrity",
"Ionise",
"Ionise",
"Jaded",
"Lactose",
"Larix",
"Lather",
"Leafy",
"Liable",
"Lightning",
"Magnificent",
"Meditate",
"Normal",
"Oasis",
"Obesity",
"Offender",
"Overdue",
"Overdo",
"Paradox",
"Password",
"Pigeon",
"Pidgin",
"Plethora",
"Powder",
"Present",
"Probably",
"Pulsar",
"Pumpkin",
"Pursuit",
"Purple",
"Recipient",
"Refrain",
"Refugee",
"Remarkable",
"Rye",
"Wry",
"Rooster",
"Scrutiny",
"Secret",
"Seldom",
"Semicircle",
"Shoulder",
"Sigma",
"Sleigh",
"Slay",
"Sniffle",
"Special",
"Spooky",
"Strategic",
"Subsidy",
"Sunflower",
"Swamp",
"Syntax",
"Tangerine",
"Telepathy",
"Thesis",
"Tremendous",
"Trinity",
"Twenty",
"Uncomfortable",
"Understand",
"Vague",
"Villain",
"Voluntary",
"Walnut",
"Warrior",
"Window",
"Youthful",
"Zombie",
"Abditive",
"Abdomen",
"Abhorrent",
"Abscond",
"Accomplishment",
"Accommodate",
"Accumulation",
"Adolescent",
"Adversity",
"Aegis",
"Aerodynamic",
"Agriculture",
"Ampersand",
"Analeptic",
"Apostrophe",
"Arcane",
"Articulate",
"Aspiration",
"Assumption",
"Asunder",
"Asthma",
"Atmospheric",
"Authenticity",
"Beneficiary",
"Benevolence",
"Blizzard",
"Blossom",
"Bronchitis",
"Brusque",
"Calibration",
"Callow",
"Candlelight",
"Caustic",
"Celebration",
"Champagne",
"Charisma",
"Chlorophyll",
"Christmas",
"Clowder",
"Cognitive",
"Colonel",
"Kernel",
"Combustible",
"Commemorate",
"Commodity",
"Compulsory",
"Concentration",
"Consumption",
"Contour",
"Controversial",
"Cuisine",
"Dauntless",
"Deployment",
"Derogatory",
"Detrimental",
"Differentiation",
"Diplomatic",
"Disappointment",
"Disconsolate",
"Division",
"Doctrine",
"Elaborate",
"Embarrassment",
"Embassy",
"Enchantment",
"Encore",
"Endeavor",
"Endeavour",
"Environmental",
"Epiphany",
"Epsilon",
"Erratic",
"Ethereal",
"Euphoria",
"Exaggerate",
"Excalibur",
"Exorcism",
"Expectation",
"Expenditure",
"Exponential",
"Extravagant",
"Fantasy",
"Favorable",
"Favourable",
"Featherweight",
"Fictitious",
"Fjord",
"Flamboyant",
"Fluorescent",
"Forthcoming",
"Frostbite",
"Fruition",
"Fugacious",
"Gastronomic",
"Gazebo",
"Germination",
"Gibberish",
"Gingerbread",
"Glacier",
"Gratitude",
"Gravestone",
"Hailstone",
"Heritage",
"Hexagonal",
"Hibernation",
"Hornswoggle",
"Hospital",
"Hourglass",
"Humanitarian",
"Hydrangea",
"Hypocritical",
"Hypothesis",
"Ideological",
"Idiom",
"Imminent",
"Imprisonment",
"Independence",
"Indifference",
"Inhabitant",
"Insinuate",
"Insipid",
"Integration",
"Intermediate",
"Intermission",
"Introspect",
"Juxtaposition",
"Kangaroo",
"Languid",
"Legendary",
"Limousine",
"Livery",
"Limina",
"Mathematician",
"Melancholy",
"Metabolism",
"Methodology",
"Microorganism",
"Misconception",
"Mistletoe",
"Multiplication",
"Myopic",
"Nebulous",
"Necromancer",
"Negotiation",
"Neighboring",
"Neighbouring",
"Noctilucent",
"Nonplussed",
"Notorious",
"Obituary",
"Oblivious",
"Opaque",
"Optimism",
"Palatine",
"Pantograph",
"Paradise",
"Paragon",
"Parallel",
"Parenthesis",
"Participation",
"Passionate",
"Peppermint",
"Periodically",
"Personnel",
"Pestilence",
"Phenomenon",
"Photographer",
"Pomegranate",
"Portfolio",
"Practitioner",
"Predominantly",
"Problematic",
"Proclamation",
"Procrastinate",
"Pronunciation",
"Propaganda",
"Protocol",
"Pygmy",
"Ravenous",
"Recession",
"Reincarnation",
"Reliability",
"Residential",
"Resilience",
"Resurrection",
"Revelation",
"Rhythm",
"Ricochet",
"Sabotage",
"Sachet",
"Sashay",
"Sapphire",
"Scholarship",
"Scythe",
"Sentimental",
"Separation",
"Shareholder",
"Significance",
"Skeleton",
"Snowflake",
"Solidarity",
"Spokesperson",
"Steadfast",
"Stereotype",
"Supposedly",
"Surrogate",
"Surveillance",
"Susceptible",
"Syllable",
"Symmetrical",
"Systematic",
"Technological",
"Thesaurus",
"Transaction",
"Translucent",
"Transparency",
"Transportation",
"Unprecedented",
"Validity",
"Venerate",
"Violation",
"Vulnerability",
"Wednesday",
"Wholeheartedly",
"Worthwhile",
"Abacaxi",
"Abasia",
"Acculturate",
"Aforementioned",
"Aggrandise",
"Aggrandize",
"Agoraphobia",
"Agoraphobic",
"Altruistic",
"Ambidextrous",
"Ambiguous",
"Amylosucrase",
"Anaphylactic",
"Anemone",
"Anisosquaric",
"Apocryphal",
"Apothecary",
"Asphyxiation",
"Asthenosphere",
"Astigmatism",
"Ataraxy",
"Attorney",
"Bandeau",
"Belvedere",
"Betwixt",
"Blatherskite",
"Bodacious",
"Bogolanfini",
"Brucellosis",
"Bucolic",
"Cacophony",
"Calamitous",
"Calumny",
"Capoeira",
"Capricious",
"Captious",
"Cerulean",
"Charcuterie",
"Chauffeur",
"Chronological",
"Cinematographer",
"Clairvoyant",
"Clandestine",
"Coalescence",
"Codicil",
"Colloquialism",
"Comeuppance",
"Commodore",
"Compunction",
"Congregation",
"Consanguine",
"Consummate",
"Contradistinguish",
"Convivial",
"Correspondence",
"Counterintuitive",
"Culvert",
"Cyrillic",
"Defenestration",
"Deleterious",
"Depilatory",
"Diminution",
"Discombobulate",
"Dodecahedron",
"Ebullition",
"Eloquent",
"Elysian",
"Elision",
"Ennui",
"Epitome",
"Erroneous",
"Erudition",
"Esurient",
"Ethnomethodology",
"Evanesce",
"Extraterrestrial",
"Facsimile",
"Fastidious",
"Fissiparous",
"Flummox",
"Foible",
"Folliculitis",
"Foraminotomy",
"Fuchsia",
"Garrulous",
"Gentrification",
"Glaucomatous",
"Glockenspiel",
"Gobbledegook",
"Gobbledygook",
"Grandiloquent",
"Grimoire",
"Handkerchief",
"Harpsichord",
"Hemoglobin",
"Haemoglobin",
"Heterozygous",
"Hierarchy",
"Homeopathy",
"Homoeopathy",
"Homogeneous",
"Horticulturist",
"Hypermetropia",
"Iconoclast",
"Idiosyncratic",
"Incandescent",
"Inchoate",
"Incoagulable",
"Indefatigable",
"Ingenious",
"Irascible",
"Isometropia",
"Isthmus",
"Kaleidoscope",
"Lachrymose",
"Latitudinarian",
"Latitudinarianism",
"Legislation",
"Lexicography",
"Liaison",
"Loquacious",
"Lugubrious",
"Lymphangiography",
"Macabre",
"Magniloquent",
"Malapropism",
"Martyrdom",
"Mellifluous",
"Menagerie",
"Mendacious",
"Meretricious",
"Metempsychosis",
"Microminiaturisation",
"Microminiaturization",
"Milieu",
"Miniscule",
"Minuscule",
"Miscellaneous",
"Monochromatic",
"Monosyllabic",
"Multidimensionality",
"Municipal",
"Myriad",
"Narcissistic",
"Nauseous",
"Neophyte",
"Neuroplasticity",
"Nincompoop",
"Nocturn",
"Nocturne",
"Nomenclature",
"Noumenon",
"Nutritious",
"Obfuscation",
"Occhiolism",
"Onomatopoeia",
"Onychophagia",
"Paradigm",
"Parliamentary",
"Paroxysm",
"Pecuniary",
"Percipient",
"Perfidious",
"Peristerophily",
"Pernicious",
"Pessimistic",
"Phantasmagoria",
"Pharaoh",
"Farrow",
"Phlegm",
"Photogeochemistry",
"Photosynthesis",
"Pirouette",
"Pneumatic",
"Polemic",
"Polychromatic",
"Polydactyly",
"Polymerisation",
"Polymerization",
"Predecessor",
"Prestigious",
"Psychological",
"Puerile",
"Pugnacious",
"Pycnidium",
"Querimony",
"Quixotry",
"Radiometeorograph",
"Rambunctious",
"Rehabilitation",
"Reminiscence",
"Rendezvous",
"Sagacious",
"Sanguine",
"Sarcophagus",
"Schizophrenic",
"Scintillate",
"Semaphore",
"Sententiously",
"Sequacious",
"Sequoia",
"Silhouette",
"Simultaneous",
"Soliloquy",
"Sovereignty",
"Subpoena",
"Subterranean",
"Supercentenarian",
"Supersede",
"Supercede",
"Syllepsis",
"Symbiosis",
"Syzygy",
"Tempestuous",
"Tetraphobia",
"Therapeutic",
"Thermionic",
"Thermoluminescence",
"Triphosphate",
"Tumultuous",
"Ubiquitous",
"Uncharacteristic",
"Unintelligible",
"Verbatim",
"Vexatious",
"Vignette",
"Xenogeneic",
"Zephyr",
"Zygote",
"Abdominothoracic",
"Absquatulate",
"Acetaminophen",
"Achromatophil",
"Achromatophilia",
"Acquiesce",
"Allotransplantation",
"Anachronistic",
"Aneurysmorrhaphy",
"Antediluvian",
"Arthroereisis",
"Ascosporogenous",
"Aspartylglucosaminuria",
"Autothaumaturgist",
"Baccalaureate",
"Batrachophobia",
"Borborygmus",
"Bougainvillia",
"Bougainvillea",
"Bourgeoisie",
"Buckminsterfullerene",
"Bureaucracy",
"Chronopsychophysiology",
"Clinicoechocardiographic",
"Coalworkerspneumoconiosis",
"Compartmentalisation",
"Compartmentalization",
"Countermajoritarianism",
"Craniosynostosis",
"Cryptoendolithic",
"Dendrochronology",
"Deoxyribonucleic",
"Dichotomisation",
"Dichotomization",
"Eclaircissement",
"Effervescent",
"Electronystagmography",
"Electrotelethermometer",
"Entrepreneur",
"Ethnopsychopharmacology",
"Ferroequinologist",
"Flibbertigibbet",
"Fossiliferous",
"Frontoethmoidectomy",
"Gastroenterologist",
"Geitonogamy",
"Geochronostratigraphical",
"Glyceraldehyde",
"Goniosynechialysis",
"Gubernatorial",
"Hemispherectomy",
"Hieroglyphics",
"Hyaluronoglucuronidase",
"Hydrochlorofluorocarbon",
"Hypercholesterolemia",
"Hypergammaglobulinemia",
"Hypergammaglobulinaemia",
"Hypergonadotropic",
"Hyperpolysyllabic",
"Hypoparathyroidism",
"Imperturbability",
"Incomprehensibility",
"Infinitesimal",
"Infundibulum",
"Institutionalisation",
"Institutionalization",
"Iodochlorohydroxyquinoline",
"Jurisprudence",
"Labyrinthine",
"Lepidopterology",
"Machiavellian",
"Mechanotransduction",
"Methemoglobinemia",
"Metonymic",
"Monocotyledonous",
"Morphodifferentiation",
"Necrobiosislipoidica",
"Neuroimmunomodulation",
"Neuropsychological",
"Oligonucleotide",
"Orthogeosyncline",
"Panproctocolectomy",
"Parallelogrammatic",
"Paraphernalia",
"Perspicacious",
"Photoreconnaissance",
"Plasmodiumfalciparum",
"Plenipotentiary",
"Portmanteau",
"Prestidigitation",
"Proceleusmatic",
"Prognostication",
"Pseudohyperaldosteronism",
"Pseudoparallelodromous",
"Pseudoriemannian",
"Psychoneuroimmunology",
"Psychopharmacotherapy",
"Psychotomimetic",
"Pulchritudinous",
"Pusillanimous",
"Quasiautobiographical",
"Quasquicentennial",
"Quetzalcoatlus",
"Quindecasyllabic",
"Quinquagintillion",
"Quoddamodotative",
"Radioallergosorbent",
"Rhinorrhagia",
"Schistochilaappendiculata",
"Septicemiccolibacillosis",
"Serendipity",
"Sesquipedalian",
"Spectrophotometer",
"Subcompartmentalisation",
"Subcompartmentalization",
"Subdermatoglyphic",
"Supererogatory",
"Superferromagnetism",
"Susurration",
"Temporomandibular",
"Thalassophobia",
"Thermochromatography",
"Tintinnabulation",
"Transinstitutionalisation",
"Transinstitutionalization",
"Trinitrotoluene",
"Utilitarianism",
"Verisimilitude",
"Worcestershire",
"Xanthogranulomatous",
"Xiphiplastron",
"Xylotypographic",
"Acetylglucocoroglaucigenin",
"Acrocephalopolydactylousdysplasia",
"Adrenocorticotrophin",
"Adrenocorticotropin",
"Anthropomorphisation",
"Anthropomorphization",
"Antidisestablishmentarianism",
"Antixerophthalmic",
"Bourgeoisification",
"Bromochlorodifluoromethane",
"Canaliculodacryocystorhinostomy",
"Chargoggagoggmanchauggagoggchaubunagungamaugg",
"Cholangiocholecystocholedochectomy",
"Cholangiopancreatography",
"Chondromyxohemangioendotheliosarcoma",
"Congenitalnasalmeningoencephalocele",
"Convolvulaceous",
"Corticopontocerebellar",
"Corynebacteriumpseudotuberculosis",
"Counterimmunoelectrophoresis",
"Dehydrothiotoluidine",
"Dermatofibrosarcomaprotuberans",
"Dextrodeorsumversion",
"Dichlorodiphenyltrichloroethane",
"Diisopropylfluorophosphate",
"Dermatofibrosislenticularisdisseminata",
"Dimethyldioctadecylammoniumchloride",
"Eellogofusciouhipoppokunurious",
"Encephalocraniocutaneouslipomatosis",
"Erythrocytapheresis",
"Esophagogastroduodenoscopy",
"Ferriprotoporphyrin",
"Floccinaucinihilipilification",
"Fluorotetraferriphlogopite",
"Fructosebisphosphatetriosephosphatelyase",
"Funkenzwangsvorstellung",
"Gastrocnemiosemimembranous",
"Gegenstandstheorie",
"Hematospectrophotometrically",
"Haematospectrophotometrically",
"Hexakosioihexekontahexaphobia",
"Hexanitrohexaazatricyclododecanedione",
"Hippopotomonstrosesquipedaliophobia",
"Hippopotomonstrosesquippedaliophobia",
"Honorificabilitudinity",
"Honourificabilitudinity",
"Hypothalamicpituitaryadrenocortical",
"Immunoelectrochemiluminescence",
"Inositolphosphorylceramide",
"Laparohysterosalpingooophorectomy",
"Laryngotracheobronchitis",
"Loncastuximabtesirine",
"Lymphangioleiomyomatosis",
"Micropachycephalosaurus",
"Neohesperidindihydrochalcone",
"Nonanonacontanonactanonaliagon",
"Nucleotidylexotransferase",
"Orotatephosphoribosyltransferase",
"Otorhinolaryngological",
"Paroxysmalnocturnalhemoglobinuria",
"Paroxysmalnocturnalhaemoglobinuria",
"Percutaneousendoscopicgastrostomy",
"Photoplethysmography",
"Phosphorodiamidatemorpholinooligomer",
"Pneumoencephalography",
"Pneumonoultramicroscopicsilicovolcanoconiosis",
"Polyphiloprogenitive",
"Pseudopseudohypoparathyroidism",
"Pseudorhombicuboctahedron",
"Psychoneuroendocrinological",
"Psychophysicotherapeutics",
"Pyrrolizidinealkaloidosis",
"Reninangiotensinaldosterone",
"Ribulosebisphosphatecarboxylaseoxygenase",
"Scaphotrapeziotrapezoidosteoarthritis",
"Sclerectoiridectomy",
"Spectrophotofluorometry",
"Sphenopalatineganglioneuralgia",
"Sphygmomanometer",
"Stereoelectroencephalography",
"Supercalifragilisticexpialidocious",
"Thymicstromallymphopoietin",
"Thyroparathyroidectomy",
"Tonsillopharyngitis",
"Uridinediphosphateglycosyltransferase",
"Uvulopalatopharyngoplasty",
"Ventriculocisternostomy",
"Xanthogranulomatouspyelonephritis",
"Zoanthroprosopometamorphopsia"
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

