package.path = "../?.lua;../?.script;" .. package.path

lulpeg = require "bin/lua/lulpeg"
re = lulpeg.re

local saint_utils = require "gamedata/scripts/saint_utils"

-- local lpeg = require "bin/lulpeg"
-- local re = lpeg.re

-- Demo

local INPUTS = {
	PDA = [[
		%c[d_cyan] • %c[ui_gray_2]Power:%c[ui_gray_3]%c[ui_gray_3] %c[255,56,166,209]100%\n%c[d_cyan] • %c[ui_gray_2]Base Cost:%c[ui_gray_3]%c[ui_gray_3] 4000 RU\n \nA pocket-sized electronic device meant to encompass the basic and most vital functions of a computer. The PDA is essential for daily information sharing. It comes with pre-installed GPS module to provide geolocation and time information to the user.\n \n%c[ui_gray_2]%C[UI_GRAY_2] %C[UI_GRAY_3]PROPERTIES%C[UI_GRAY_2]:%c[ui_gray_2]\n \n%c[d_cyan] • %c[ui_gray_2]Technological Item\n%c[d_cyan] • %c[ui_gray_2]Low Electric Power Consumption%c[255,93,0,116]  • %c[255,140,140,140] Power Consumption:%c[ui_gray_3] %c[255,170,170,170]23 MAh/Sec
	]],
	BEER = [[
		Ukrainian beer. Another popular beverage in the Zone besides vodka.\n \n%c[ui_gray_3]PROPERTIES:\n%c[d_blue] • %c[ui_gray_2] drink\n%c[d_blue] • %c[ui_gray_2] imported\n%c[d_red] •%c[ui_gray_2] light alcohol\n%c[d_blue]•%c[ui_gray_2] clean nutrition source\n%c[d_blue]  •  %c[ui_gray_2] high quality\n
	]],
	PISTOL = [[
		STATUS:\n%c[ui_gray_2] • %c[d_green] functional barrel (100% DMG and AP)\n%c[ui_gray_2] • %c[d_green] functional trigger mechanism\n%c[ui_gray_2] • %c[d_green] functional recoil spring\n%c[d_green] • loaded magazine: Standard 9x18 PMM magazine\n• base cost: 12000 RU\n\nThe Makarov PMM is a redesign of the original Makarov PM. In 1990 a group of engineers reworked the original Makarov, primarily by increasing the load for the cartridge. The result is 25% more gas pressure increasing muzzle velocity. The PMM magazine also holds 12 rounds, compared to the PM's 8.\n \n%c[0,255,255,255]CHARACTERISTICS:\n%c[d_cyan] • %c[0,255,255,255]Origin: %c[ui_gray_1]Soviet Union\n%c[d_cyan] • %c[0,255,255,255]Manufacturer: %c[ui_gray_1]Izhevsk Mechanical Plant\n%c[d_cyan] • %c[0,255,255,255]Production Year: %c[ui_gray_1]1990\n
	]],
	RIFLE = [[
		%c[255,93,0,116]STATUS:\n%c[d_cyan] • %c[ui_gray_2]Functional Gas System\n%c[d_cyan] • %c[ui_gray_2]Functional Trigger Mechanism\n%c[d_cyan] • %c[ui_gray_2]Functional Bolt Carrier\n%c[d_cyan] • %c[ui_gray_2]Functional barrel%c[255,170,170,170] (100% DMG and AP)\n%c[d_cyan] • %c[ui_gray_2]Functional Bolt\n%c[d_cyan] • %c[ui_gray_3]Loaded Magazine:%c[ui_gray_2]%c[ui_gray_2] %c[255,170,170,170]Standard 5.45x39 AK-74M Magazine\n%c[d_cyan] • %c[ui_gray_3]Condition:%c[ui_gray_2]%c[ui_gray_2] %c[255,51,255,102]100%\n%c[d_cyan] • %c[ui_gray_3]Base Cost:%c[ui_gray_2]%c[ui_gray_2] 38950 RU\n \nBased on previous AK rifles in internal design and layout, the AEK-971 is also equipped with a recoil-balancing mechanism, resulting in more controllable automatic fire. Small batches of this rifle were manufactured for the Russian MVD.\n \n%c[0,255,255,255]PROPERTIES:\n%c[d_cyan] • %c[ui_gray_3]Origin:%c[ui_gray_2]%c[ui_gray_2] %c[ui_gray_1]Soviet Union\n%c[d_cyan] • %c[ui_gray_3]Manufacturer:%c[ui_gray_2]%c[ui_gray_2] %c[ui_gray_1]Degtyarev Plant\n%c[d_cyan] • %c[ui_gray_3]Production Year:%c[ui_gray_2]%c[ui_gray_2] %c[ui_gray_1]1980
	]]
}

do
	local input = INPUTS.PDA

	local output = saint_utils.normalize_desc(input)
	-- Replace occurrences of escaped newlines with regular newlines for printing.
	output = output:gsub("\\n", "\n")
	print(output)
end