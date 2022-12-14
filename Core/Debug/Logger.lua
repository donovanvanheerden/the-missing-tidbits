--@type class TMT
local T = TMT

function T:Log(...)
    if (T.db == nil or not T.db.debug) then return end

    T:Print(...)
end

--- Uses the DevTools_Dump internally, only outputs if in debug mode
function T:Dump(value)
    if (not T.db.debug) then return end

    DevTools_Dump(value)
end

--- Tries to dump variable
---@param table table
---@param depth number
function T:DumpTable(table, depth)
    if (not T.db.debug) then return end

	local padding = ""

	if depth > 0 then
		padding = string.strrep(" ", depth)
	end

	if type(table) ~= "table" then
		print(padding, table)
	else
		for key, value in pairs(table) do
			if type(value) == "table" then
				T:DumpTable(value, depth + 1)
			else
				print(padding, key, ": ", value)
			end
		end
	end
end