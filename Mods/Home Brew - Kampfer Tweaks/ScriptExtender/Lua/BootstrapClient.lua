local function home_brew_remove_subclasses()

    local knowledgeDomain = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "ebe18794-b5e1-41c4-befa-4b9d6922b0ec",
            class = "1dbce574-fff1-49be-b7da-704f9b73cad9"
        }
    }

    local lightDomain = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "c54d7591-b305-4f22-b2a7-1bf5c4a3470a",
            class = "1dbce574-fff1-49be-b7da-704f9b73cad9"
        }
    }

    local natureDomain = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "6dec76d0-df22-411c-8a78-3d6fb843ae50",
            class = "1dbce574-fff1-49be-b7da-704f9b73cad9"
        }
    }

    local trickeryDomain = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "f013d01b-3310-43f7-81bf-a51130442b5e",
            class = "1dbce574-fff1-49be-b7da-704f9b73cad9"
        }
    }

    -- Paladin Subclasses
    local oathbreaker = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "6fb3831e-45d8-4b30-9714-6fe73988921b",
            class = "b60618d1-c262-42b5-9fdd-2c0f7aa5e5af"
        }
    }

    -- Wizard Subclasses
    local conjurationWizard = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "7a3feb8d-dda7-46ec-9029-1f302f537432",
            class = "c201c736-3717-4c3c-9e36-2ae7387597a3"
        }
    }

    local divinationWizard = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "7577b0e1-a517-4f82-8f72-05a227dc5e88",
            class = "c201c736-3717-4c3c-9e36-2ae7387597a3"
        }
    }

    local enchantmentWizard = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "46d31950-6917-444e-ac87-706702825215",
            class = "c201c736-3717-4c3c-9e36-2ae7387597a3"
        }
    }

    local illusionWizard = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "436c9e1a-3a39-48dd-b753-7cee1bd19c00",
            class = "c201c736-3717-4c3c-9e36-2ae7387597a3"
        }
    }

    local transmutationWizard = {
        {
            modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
            subClassGuid = "a12f2924-30b4-4185-9db9-2c5b383ff449",
            class = "c201c736-3717-4c3c-9e36-2ae7387597a3"
        }
    }

    -- Remove Cleric Subclasses excluded from Home Brew
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(knowledgeDomain)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(lightDomain)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(natureDomain)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(trickeryDomain)

    -- Oathbreaker shouldn't be selectable form the level up menu
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(oathbreaker)

    -- Remove Wizard Subclasses excluded from Home Brew
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(conjurationWizard)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(divinationWizard)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(enchantmentWizard)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(illusionWizard)
    Mods.SubclassCompatibilityFramework.Api.RemoveSubClasses(transmutationWizard)
end

local remove_selector_template = {
    {
        modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
        TargetUUID = "",
        FileType = "Feat",
        Function = "SelectAbilities",
        ListUUID = ""
    }
}

local add_selector_template = {
    {
        modGuid = "dd4e8687-c280-457e-971f-30d133f55f8b",
        Target = "",
        FileType = "Feat",
        Function = "SelectAbilities",
        Params = {
            Guid = "b9149c8e-52c8-46e5-9cb6-fc39301c05fe",
            Amount = 2,
            AbilityAmount = 2
        }
    }
}

local function feat_asi_patch()
    for _, uuid in pairs(Ext.StaticData.GetAll("Feat")) do
        local feat = Ext.StaticData.Get(uuid, "Feat")

        -- Filter out any feat that allows to pick passives out of Home Brew ASI passive list
        for _, passive in pairs(feat.SelectPassives) do
            if passive.UUID == "b9149c8e-52c8-46e5-9cb6-fc39301c05fe" then
                goto continue
            end
        end

        -- There aren't any feats that add ability selectors in Home Brew, but just in case
        for _, ability in pairs(feat.SelectAbilities) do
            remove_selector_template[1].TargetUUID = uuid
            remove_selector_template[1].ListUUID = ability.UUID
            Mods.SubclassCompatibilityFramework.Api.RemoveSelectors(remove_selector_template)
        end

        add_selector_template[1].Target = uuid
        Mods.SubclassCompatibilityFramework.Api.InsertSelectors(add_selector_template)

        ::continue::
    end
end

local function kampfer_patches()
    home_brew_remove_subclasses()
    feat_asi_patch()
end

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
    Ext.Events.StatsLoaded:Subscribe(kampfer_patches)
end
