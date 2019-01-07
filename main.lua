require("hotfix")

local test = Import("test.lua")

function sleep(n)
    local t0 = os.clock()
    while os.clock() - t0 <= n do end
end

print(test)
for k,v in pairs(test) do
    print(k,v)
end

function main()
    while true do
        ReImport("test.lua")
        test.foo()
        test.g_foo()
        sleep(3)
    end
end

main()

