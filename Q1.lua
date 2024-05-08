-- Q1 - Fix or improve the implementation of the below methods

local function releaseStorage(player)
    -- NOTE: Set storage value to 1000 with a -1 flag?
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    -- NOTE: when player object logs out, run this function. 
    if player:getStorageValue(1000) == 1 then
        -- EDIT: Fix function call
        addEvent(releaseStorage(player))
    end

    return true
end
