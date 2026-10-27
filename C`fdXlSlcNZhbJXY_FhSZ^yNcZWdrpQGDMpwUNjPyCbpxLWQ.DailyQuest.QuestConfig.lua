-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.DailyQuest.QuestConfig
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.DailyQuest
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

({}).Weekly = {
    Kills = {},
    Headshots = {},
    DestroyGadgets = {},
    DestroyDrones = {},
    Wins = {},
    PlayAsOperator = {},
    PlayOnTeam = {},
    CompleteDailyQuests = {}
};

return {
    Daily = {
        Kills = {
            QuestIcon = "rbxassetid://130909424562300",
            DisplayName = "Eliminate opponents",
            Description = "Neutralize enemies using any method available.",
            Objectives = {
                Goal = 15,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        Headshots = {
            QuestIcon = "rbxassetid://96332077029502",
            DisplayName = "Headshot only",
            Description = "Neutralize enemies with a headshot.",
            Objectives = {
                Goal = 15,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        Wallbangs = {
            QuestIcon = "http://www.roblox.com/asset/?id=12181404960",
            DisplayName = "No safe spots",
            Description = "Eliminate enemies shooting through a destructible surface.",
            Objectives = {
                Goal = 5,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        DestroyGadgets = {
            QuestIcon = "http://www.roblox.com/asset/?id=15889469852",
            DisplayName = "Safety first",
            Description = "Destroy enemy gadgets.",
            Objectives = {
                Goal = 20,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        DestroyDrones = {
            QuestIcon = "rbxassetid://108847587126300",
            DisplayName = "Drone hunter",
            Description = "Destroy enemy drones.",
            Objectives = {
                Goal = 20,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        DestroyCameras = {
            QuestIcon = "http://www.roblox.com/asset/?id=1736184055",
            DisplayName = "Camera hunter",
            Description = "Destroy enemy cameras.",
            Objectives = {
                Goal = 20,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        Wins = {
            QuestIcon = "http://www.roblox.com/asset/?id=109962211885492",
            DisplayName = "Road to victory",
            Description = "Win rounds in multiplayer.",
            Objectives = {
                Goal = 10,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        PlayAsOperator = {
            QuestIcon = "http://www.roblox.com/asset/?id=4673498741",
            DisplayName = "Operator requested",
            Description = "Win multiplayer rounds as %s.",
            Objectives = {
                Goal = 5,
                Tracker = 0,
                SpecificOperator = true
            },
            Rewards = {
                Credits = 500
            }
        },
        PlayOnTeam = {
            QuestIcon = "http://www.roblox.com/asset/?id=3639532669",
            DisplayName = "For a greater cause",
            Description = "Win multiplayer rounds on %s\'s side.",
            Objectives = {
                Goal = 5,
                Tracker = 0,
                SpecificTeam = true
            },
            Rewards = {
                Credits = 500
            }
        },
        Reinforcement = {
            QuestIcon = "http://www.roblox.com/asset/?id=5993165103",
            DisplayName = "Time to work",
            Description = "Deploy wall reinforcements or Ampata ability.",
            Objectives = {
                Goal = 25,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        Heal = {
            QuestIcon = "http://www.roblox.com/asset/?id=181035744",
            DisplayName = "Just a scratch",
            Description = "Heal allies in a total of 500 points.",
            Objectives = {
                Goal = 500,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        ObjectiveHidden = {
            QuestIcon = "http://www.roblox.com/asset/?id=1137375826",
            DisplayName = "No one knows",
            Description = "Don\'t let Attackers find the objetive in setup phase.",
            Objectives = {
                Goal = 5,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        },
        ScanEnemies = {
            QuestIcon = "http://www.roblox.com/asset/?id=15875255096",
            DisplayName = "Third eye",
            Description = "Scan 25 enemies.",
            Objectives = {
                Goal = 25,
                Tracker = 0
            },
            Rewards = {
                Credits = 500
            }
        }
    }
};