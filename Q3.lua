-- Q3 - Fix or improve the name and the implementation of the below method

-- EDIT: This function removes the player {membername} from the party
-- associated with the player with ID {playerId}.
function remove_Player_from_Party(playerId, membername)
    -- NOTE: Get Player obj for playerId. This is the player that requested the removal.
    player = Player(playerId)
    -- NOTE: Get party that player is in.
    local party = player:getParty()
    local found = false

    -- EDIT: I would check to see if the player who made the request has permission to do so.
    -- This might already be checked elsewhere.
    if player.isModerator(party) == false then
        error("Error: " ..player.name .."does not have permission to remove members from " ..party.name)
    end

    -- NOTE: If a member of the party matches membername, remove them from the party.
    -- EDIT: I like the '_' notation for unused keys, but it may not gel with existing code.
    for _,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(Player(membername))
            found = true
            break   -- EDIT: leave loop after finding match
        end
    end

    -- EDIT: Check if the player was actually found.
    if found then
        -- EDIT: If party:removeMember() doesn't also remove the party from membername, do it here.
        removed_player = Player(membername)
        removed_player:setParty(nil)
    else
        -- EDIT: Throw an error if the player was not found in the party.
        error("ERROR: User '" ..membername .."' not found in " ..party.name)
    end
end