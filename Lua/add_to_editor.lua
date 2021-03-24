table.insert(editor_objlist_order, "text_branching_is")
table.insert(editor_objlist_order, "text_branching_and")
table.insert(editor_objlist_order, "text_branching_has")
table.insert(editor_objlist_order, "text_branching_near")

editor_objlist["text_branching_is"] = 
{
	name = "text_branching_is",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text, abstract, text_verb"},
	tiling = -1,
	type = 1,
	layer = 20,
	colour = {2, 2},
    colour_active = {2, 4},
}

editor_objlist["text_branching_and"] = 
{
	name = "text_branching_and",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text, abstract, text_verb"},
	tiling = -1,
	type = 6,
	layer = 20,
	colour = {2, 2},
    colour_active = {2, 4},
}

editor_objlist["text_branching_has"] = 
{
	name = "text_branching_has",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text, abstract, text_verb"},
	tiling = -1,
	type = 1,
	layer = 20,
	colour = {2, 2},
    colour_active = {2, 4},
}

editor_objlist["text_branching_near"] = 
{
	name = "text_branching_near",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text, abstract, text_condition"},
	tiling = -1,
	type = 7,
	layer = 20,
	colour = {2, 2},
    colour_active = {2, 4},
}

formatobjlist()