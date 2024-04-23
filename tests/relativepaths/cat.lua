if os.getenv "LOCAL_LUA_DEBUGGER_VSCODE" == "1" then
	local lldebugger = require "lldebugger"
	lldebugger.start()
end

local f = assert(io.open(..., "r"))

print(f:read "*a")