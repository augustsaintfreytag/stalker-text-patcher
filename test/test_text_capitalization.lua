package.path = "../?.lua;../?.script;" .. package.path

lulpeg = require "bin/lua/lulpeg"
re = lulpeg.re

local saint_utils = require "gamedata/scripts/saint_utils"

-- Demo

local INPUTS = {
	ITEM_NAME = "Plastic film",
	ITEM_NAME_WITH_PARENTHETICAL = "Laboratory access keycard (yellow)",
	WEAPON_NAME_WITH_PARENTHETICAL = "veretta 92f (custom)",
	WEAPON_NAME_WITH_QUOTES = "AK 47m \"Venom\"",
	GEAR_NAME_VERY_LONG = "Headlamp w/ oracle psy-stimulator",
	GEAR_PROPERTY_VALUE = "Power consumption: 15 mah/sec",
	WEAPON_PROPERTY_TWO_PART = "Muzzle velocity",
	WEAPON_PROPERTY_TWO_PART_WITH_DOT = "Mag. size",
	BULLET_POINT_WITH_PARENTHETICAL = "%c[d_cyan] • %c[ui_gray_2]Functional barrel%c[255,170,170,170] (100% DMG and AP)",
}

do
	for _, input in pairs(INPUTS) do
		local output = saint_utils.capitalize_words(input)
		print(output)
	end
end
