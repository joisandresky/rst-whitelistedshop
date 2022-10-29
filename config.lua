Config = {}

Config.UseSociety = true -- change this if you want to use Society Account to Purchase Vehicle! (qb-management)
-- Config.UseOkokBanking = false -- Future Plan. change this if you want to integrate with okokBanking (NEWEST OKOK BANKING -> okokBanking:AddNewTransaction)

Config.Locations = {
    ["police_vehicle_shop"] = {
        label = "RSPD Vehicle Shop", -- Label for QB Menu
        job = "police", -- Specified Job name
        location = vector4(463.05, -983.82, 25.7, 90.14), -- Ped Location
        defaultGarage = "police" -- Name of Garage, provide valid name
    },
    ['ambulance_vehicle_shop'] = {
        label = "RST Medical Center Vehicle Shop",
        job = "ambulance",
        location = vector4(-419.77, -350.6, 24.23, 109.73),
        defaultGarage = "hospital_parking"
    },
    ['mechanic_vehicle_shop'] = {
        label = "Radiator Springs Vehicle Shop",
        job = "mechanic",
        location = vector4(-357.85, -137.36, 39.43, 65.91),
        defaultGarage = "mechanic_parking"
    },
    ['burgershot_vehicle_shop'] = {
        label = "Subway Vehicle Shop",
        job = "burgershot",
        location = vector4(-1255.17, -273.42, 38.97, 31.28),
        defaultGarage = "subway_parking"
    },
    ['gangster_vehicle_shop'] = {
        label = "Gangster Vehicle Shop",
        -- job = "burgershot",
        gang = "ballas",
        isGang = true,
        location = vector4(-23.29, -1426.34, 30.66, 88.85),
        defaultGarage = "ballas"
    },
    ['biker_vehicle_shop'] = {
        label = "Bikers Vehicle Shop",
        -- job = "burgershot",
        gang = "lostmc",
        isGang = true,
        location = vector4(994.43, -105.43, 74.16, 234.36),
        defaultGarage = "lostmc"
    },
    ['cartel_vehicle_shop'] = {
        label = "Cartel Vehicle Shop",
        -- job = "burgershot",
        gang = "cartel",
        isGang = true,
        location = vector4(25.26, 542.66, 176.03, 59.69),
        defaultGarage = "cartel"
    },
    ['mafia_vehicle_shop'] = {
        label = "Mafia Vehicle Shop",
        -- job = "burgershot",
        gang = "triads",
        isGang = true,
        location = vector4(-807.46, 188.12, 72.48, 105.82),
        defaultGarage = "triads"
    },
}

Config.Vehicles = {
    ["police"] = {
        [1] = {
            name = "policegt350r",
            minGrade = 1,
            price = 1000
        },
        [2] = {
            name = "police2",
            minGrade = 0,
            price = 1000
        },
        [3] = {
            name = "police4",
            minGrade = 1,
            price = 1000
        },
        [4] = {
            name = "police",
            minGrade = 1,
            price = 1000
        },
        [5] = {
            name = "policet",
            minGrade = 0,
            price = 1000
        },
        [6] = {
            name = "policeb",
            minGrade = 0,
            price = 1000
        },
        [7] = {
            name = "police3",
            minGrade = 2,
            price = 1000
        },
        [8] = {
            name = "fbi",
            minGrade = 8,
            price = 1000
        },
        [9] = {
            name = "pranger",
            minGrade = 2,
            price = 1000
        },
        [10] = {
            name = "pbus",
            minGrade = 1,
            price = 1000
        },
        [9] = {
            name = "riot",
            minGrade = 4,
            price = 1000
        },
    },
    ["ambulance"] = {
        [1] = {
            name = "ambulance",
            minGrade = 0,
            price = 1000
        },
        [2] = {
            name = "SAFTA",
            minGrade = 0,
            price = 1000
        },
        [3] = {
            name = "polgs350",
            minGrade = 2,
            price = 1000
        },
        [4] = {
            name = "r1200rtp",
            minGrade = 0,
            price = 1000
        },
    },
    ["mechanic"] = {
         [1] = {
             name = "dsflatbed",
             minGrade = 0,
             price = 200
         },
        [2] = {
            name = "sg1150",
            minGrade = 0,
            price = 200
        },
    },
    ["burgershot"] = {
        [1] = {
            name = "faggio2",
            minGrade = 0,
            price = 200
        },
        [2] = {
            name = "pony",
            minGrade = 0,
            price = 200
        },
    },
    ["ballas"] = {
        [1] = {
            name = "sultan",
            minGrade = 0,
            price = 500
        }
    },
    ["cartel"] = {
        [1] = {
            name = "sultan",
            minGrade = 0,
            price = 500
        }
    },
    ["triads"] = {
        [1] = {
            name = "sultan",
            minGrade = 0,
            price = 500
        }
    },
    ["lostmc"] = {
        [1] = {
            name = "sanchez",
            minGrade = 0,
            price = 500
        }
    },
}