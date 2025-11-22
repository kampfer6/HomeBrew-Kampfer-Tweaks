function Map(table, f)
    local t = {}
    for i, v in ipairs(table) do
        t[i] = f(v)
    end
    return t
end

function Filter(table, predicate)
    local t = {}
    for _, v in ipairs(table) do
        if predicate(v) then
            t[#t + 1] = v
        end
    end
    return t
end

function Replace_Or_Append_Stat(stat, pattern, replacement)
    stat = stat or ""

    if pattern and stat:match(pattern) then
        return stat:gsub(pattern, replacement)
    end

    return (stat == "" and replacement or (stat .. ";" .. replacement))
end

function Add_Or_Replace_Attunement(status_string, use_costs_string, new_attunement_level)
    local new_attunement = "ATTUNEMENT" .. new_attunement_level
    local new_costs = "Attunement:" .. new_attunement_level

    local result_status = Replace_Or_Append_Stat(status_string, "ATTUNEMENT%d+", new_attunement)
    local result_costs = Replace_Or_Append_Stat(use_costs_string, "Attunement:%d+", new_costs)

    return result_status, result_costs
end
