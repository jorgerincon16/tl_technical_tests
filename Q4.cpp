// Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
    // NOTE: Get a pointer to player obj with name == recipient.
    Player* player = g_game.getPlayerByName(recipient);
    // NOTE: If that function returned null, try a backup function.
    if (!player) {
        player = new Player(nullptr);
        // NOTE: If we can't load a player with this other method, get outta here.
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // EDIT: Need to delete pointer
            delete (player);
            return;
        }
    }

    // NOTE: Get a pointer to a new item with this ID == itemId.
    Item* item = Item::CreateItem(itemId);
    // NOTE: If the item could not be created, get outta here.
    if (!item) {
        // EDIT: Delete pointers
        delete (player);
        delete (item);
        return;
    }

    // NOTE: In the global game object, add the item to the player's inbox.
    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    // EDIT: Delete pointers
    delete (player);
    delete (item);
}
/*
    Been a while since I worked in C++, but I remember pointers well.
    While working on this, I learned about smart pointers. If I was improving this, I would try to use those to avoid the hassle.
*/