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
        location = vector4(298.71, -618.68, 43.45, 338.71),
        defaultGarage = "ambulance"
    }
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
    }
}