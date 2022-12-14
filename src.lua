local cloneref = cloneref or function(ref)
    return ref
end
local clonefunction = clonefunction or function(func)
    return func
end
local game = cloneref and cloneref(game) or game
local GetService = clonefunction and clonefunction(game.GetService) or game.GetService
local InsertService = cloneref and cloneref(GetService(game, "InsertService")) or GetService(game, "InsertService")
local LoadLocalAsset = clonefunction and clonefunction(InsertService.LoadLocalAsset) or InsertService.LoadLocalAsset
local table_insert = clonefunction and clonefunction(table.insert) or table.insert
local pcall = clonefunction and clonefunction(pcall) or pcall
local getobjects = function(a)
    local Objects = {}
    if a then
        local b = LoadLocalAsset(InsertService, a)
        if b then 
            pcall(table_insert, Objects, b) 
        end
    end
    return Objects
end
if getgenv then
    getgenv().getobjects = getobjects
else
    shared.getobjects = getobjects
end
