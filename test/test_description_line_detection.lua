package.path = "../?.lua;../?.script;" .. package.path

lulpeg = require "bin/lua/lulpeg"
re = lulpeg.re

local saint_utils = require "gamedata/scripts/saint_utils"

-- Demo

local INPUTS = {
	SECTION_HEADER = "PROPERTIES:",
	HANDGUN_DESCRIPTION =
	"A redesign of the legendary Makarov, the PMM uses a 25% increase in gas pressure to significantly increase muzzle velocity and features a larger 12-round magazine. Though, even with these changes slightly bridging the gap between itself and modern pistols, it still loses out in terms of weight and general performance."
}

do
	local line = INPUTS.SECTION_HEADER
	local what = re.find(line, "^[A-Z ]^+3':'*")

	print(what)
end
