function get_children(t, seen)
    if seen == nil then seen = {} end
    if (seen[tostring(t)]) == true then return {} end
    seen[tostring(t)] = true

    local children = {}
    for k,v in pairs(t) do 
        if type(v) == "table" then
            for k2,v2 in pairs(get_children(v, seen)) do
                children[tostring(k) .. '.' .. tostring(k2)] = v2
            end
        else
            children[tostring(k)] = v
        end
    end
    return children
end
local all_elements = get_children(require("luasnip.loaders.from_vscode"))
for k,v in pairs(all_elements) do
    print(tostring(k) .. ": " .. tostring(v))
end
