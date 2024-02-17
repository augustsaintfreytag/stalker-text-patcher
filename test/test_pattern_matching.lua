local str = "ui_mcm_item_artefact_title"
local match = string.match(str, "ui_mcm_.+_title")

if match then
	print("Match found!")
else
	print("Match not found!")
end
