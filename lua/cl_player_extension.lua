local Player = FindMetaTable("Player")function Player:PS_GetPoints()	return self.PS_Points or 0endfunction Player:PS_GetItems()	return self.PS_Itemsendfunction Player:PS_HasItem(item)	return table.HasValue(self.PS_Items, item)endfunction Player:PS_CanAfford(cost)	return self:PS_GetPoints() - cost >= 0endusermessage.Hook("PointShop_Points", function(um)	LocalPlayer().PS_Points = um:ReadLong() or 0end)datastream.Hook("PointShop_Items", function(handler, id, encoded, decoded)	LocalPlayer().PS_Items = decoded or {}end)