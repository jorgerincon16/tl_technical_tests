-- Q2 - Fix or improve the implementation of the below method

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    -- EDIT: Remove string.format() for readability, though I see how %d protects the query from non-digit values.
    -- If memberCount is entered by a user, I would keep it how it was, except maybe include the string.format() when declaring selectedQuery.
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < "..memberCount..";"
    local resultId = db.storeQuery(selectGuildQuery)
    -- EDIT: Return false if query turns up empty.
    if resultId == false then
        return false
    end
    -- EDIT: Not sure exactly how this db library works, but I want to iterate over the result table.
    repeat
        print(result.getString(resultId, "name"))
    until(not result.next(resultId))
end