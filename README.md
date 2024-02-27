![Officer Document Stacks B 03](https://github.com/augustsaintfreytag/stalker-text-patcher/assets/7656669/6fddb4e4-ed3b-491b-9bc2-ec29cdfff1ee)

# STALKER Text Patcher

A script mod for STALKER Anomaly (Open X-Ray) to hot-patch names and descriptions of items before presentation. Hooks into the game's `ui_item.script` module to parse, format, and reprocess names and descriptions before they are displayed.

> [!NOTE]
> This mod is in *active development* and should be considered *work in progress* but safe to use.
> It can be installed in your game in its current version, an official ModDB release is pending.
> This warning will be removed once the mod has been tested and is considered fully playable.

## Features

This mod aims to provide the following features:

- Implement capitalisation following the rules of the APA style guide (utils)
- Capitalise all item names (any length)
- Capitalise contents inside parentheses in all item names
- Rewrite hyphenated lists in item descriptions as proper bullet points
- Rewrite section headers in item descriptions (configurable)
- Detect text intended to be a section headers and format them as such (configurable)
- Fix bullet points if two appear in a single line (missing line break)
- Fix varying spacing used before or after bullet points in item descriptions
- Capitalise bullet points in item descriptions (using basic content heuristics)
- Apply consistent colours to dots and text in bullet points in item descriptions
- Reformat all spacing for sections in item descriptions (paragraph, header, bullet points)
- Trim extraneous whitespace before or after item descriptions

> [!WARNING]
> This mod is designed for *English* first and formatting functionality for Ukrainian or Russian localization has not been tested. Whole text substitutions use XML files that run through the same engine-level translation functions as other text in the game; as such, localization in all of the game's supported languages is generally supported if an XML text file for the language is provided. The engine may fall back to a default locale or output unlocalized strings when missing a localized variant. See `configs/text/<locale>` for string files.

## Approach

As more mods get developed and combined in packs, keeping naming conventions and typography consistent manually is an incredibly demanding task. An individual mod may be internally consistent but modpack creators will have to make a lot of edits to achieve the same for a whole pack of hundreds of mods. This patcher tries to address the overarching inconsistencies and formatting issues of labels, names, and descriptions with a script-based one-size-fits-all approach.

The first part of this mod is a script-based module that augments the formulation of name and description texts via `ui_item`. Game engine calls two primary functions, `item_name` and the pair of `build_desc_header` and `build_desc_footer` to process item-related text (e.g. text shown in player inventory and tooltips). The text concatenated by the base game and all other preceding mods is then read, rewritten in multiple passes, and output as a consistently formatted piece. The behaviour of this module's rewrite passes can be configured in `saint_utils_config`.

The second module is a DXML mod that handles supplementary patches for text that does not run through the `ui_item` script. The DXML part handles formatting for the labels of in-game menu items and also performs configurable arbitrary text substitution. It allows patching specific records in all of the game's localisation XML files using patterns, enabling easy to use bulk processing of strings.

Actual item data is not touched and only rewritten in-engine before it is presented. Because of this post-processing approach, this mod is compatible with all other mods and mod packs and can patch virtually any item name and description text. Behaviour of all modules of this mod can be customised using the included `*_config` files. Do not edit the main mod script files.

## License

This mod was created by Saint for free use by the STALKER modding community with basic attribution under the MIT license. It may be distributed with mod packs.

Includes modules using DXML, created by Demonized (https://github.com/themrdemonized).

Bundles and uses the LuLPeg library port (https://github.com/pygy/LuLPeg) by Pierre-Yves Gerardy, licensed under the Romantic WTF license.
LuLPeg uses the `re` module and tests, copyright (c) 2013 Lua.org, PUC-Rio.
