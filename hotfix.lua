function _G.MEMVAR(key, def)
    if not __MEMVAR_LIST__ then
        __MEMVAR_LIST__ = {}
    end
    if not __MEMVAR_LIST__[key] then
        __MEMVAR_LIST__[key] = def or {}
    end
    return __MEMVAR_LIST__[key]
end

local function GetFileKey(name)
    return "FILE:" .. name
end

function _G.Import(name)
    local key = GetFileKey(name)
    if _G[key] then
        return _G[key]
    end

    local tb = {}
    setmetatable(tb, {__index = _G})
    _G[key] = tb

    local fn, msg = loadfile(name, "tb", tb)
    if not fn then
        print(string.format("Import [%s] filed. %s", name, msg))
        return _G[key]
    end

    local t = fn()
    if type(t) == "table" then
        for k,v in pairs(t) do
            if type(_G[key][k]) ~= "nil" then
                print(string.format("Import [%s] ignore var [%s]. duplicate keys", name, k))
            end
            _G[key][k] = v
        end
    end

    return _G[key]
end

function _G.ReImport(name)
    local key = GetFileKey(name)
    if not _G[key] then
        return
    end

    local fn, msg = loadfile(name, "tb", _G[key])
    if not fn then
        print(string.format("Re import [%s] filed. %s", name, msg))
        return
    end

    local t = fn()
    if type(t) == "table" then
        for k,v in pairs(t) do
            if type(_G[key][k]) ~= "nil" then
                print(string.format("Import [%s] ignore var [%s]. duplicate keys", name, k))
            end
            _G[key][k] = v
        end
    end
    print(string.format("Re import [%s] ok", name))
end

