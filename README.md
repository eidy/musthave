Must Have
---------

Specify some item types that the player must always have one of in their inventory.  They can't drop it and if it's trashed it will just be re-created.
 

minetest.conf Parameters
------------------------
musthave

If set, every player must have the items specified.


API
---
musthave.set(playername, itemlist)

Specifies a list of items a specific player must have.
(Note: This is not currently saved)

musthave.get(playername)

Returns a table of items (spec strings) the player must have