config = {}

function config.fileExists(path)
    local f = io.open(path, 'r')
    return f ~= nil and io.close(f)
end

function config.createConfig(path, data)
	if config.fileExists(path) then return end
	local file = io.open(path, "w")
	local jconfig = json.encode(data)
	file:write(jconfig)
	file:close()
end

function config.loadFile(path)
    local file = io.open(path, "r")
    local config = json.decode(file:read("*a"))
    file:close()
    return config
end

function config.saveFile(path, data)
    local file = io.open(path, "w")
    local jconfig = json.encode(data)
    file:write(jconfig)
    file:close()
end

return config