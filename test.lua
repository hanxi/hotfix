local M = {}

local mpData = MEMVAR("test.mpData")
local mpData2 = MEMVAR("test.mpData2", {
    A = 1,
})
print(mpData2.A)

function M.foo()
    print("foo2", mpData.test)
end

-- this func will be ignore
function foo()
    print("ignore_foo2")
end

function g_foo()
    print("g_foo2")
end

return M

