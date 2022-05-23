# pmr_item_tracker CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v0.9.0] - 2022-05-23
### 🔄 Check updates
- Added more places to capture items.
  - Tubba Blubba's Castle
    - Item on the table before 2F access
  - Shy Guy's Toybox
    - Peach's choice items, viewable in the Kammy Koopa cutscene
  - Mt. Lavalava
    - Item on top of the bricks in the central cavern
  - Koopa Region
    - Item across water below first bridge
    - Item on stump behind Kooper's house
    - Item on top of bricks on the path to Koopa Bros. Fortress
  - Dry Dry Desert
    - Item on bricks in cell R5C6
  - Gusty Gulch
    - Item on rock on path to Tubba Blubba's Castle
  - Flower Fields
    - Rosie's item, which is shown to Mario during/after her first dialogue
    - Item on the ledge above the Bubble Flower
  - Boo's Mansion
    - Mansion shop is viewable before completing Bow's quest
- Flower Fields
  - The check for shaking Petunia's tree now clears in one click.

### 🔧 Check Fixes
- Shooting Star Summit
  - Panel and freestanding item at the summit is now visible on the tracker.
  - Name of check behind Summit now standardized to "on ground".
- Mt. Rugged
  - Allow Parakarry to access the item on the first ledge in `IWA_01`.
  - Add missing ledge check in `IWA_03`.
- Dry Dry Desert
  - Fixes typos in `short_name` of R2C5 checks.
- Tubba Blubba's Castle
  - Now accessible with Lakilester OR Bow, not Lakilester AND Bow.
- Shy Guy's Toybox
  - Green Station west chest after Peach's Choice is now visible on the tracker.
- Flower Fields
  - Add Star Piece image to panel check in `FLO_25`.
  - Require Lakilester to progress past the NE elevator room.

### 🔄 Logic updates
- Chapter 2
  - Removes dependency on `flag_bombed_train_rock` for Mt. Rugged and beyond, it adds no value and hides checks.
  - The location for bombing the rock is still visible, but has no bearing on the tracker's logic.
- Boo's Mansion
  - Detached `flag_attached_weight` from checks past the chandelier, it adds no value and hides checks.
  - The location for attaching the weight is still visible, but has no bearing on the tracker's logic.

### 🔧 Logic Fixes
- Open Whale now correctly allows players to Jade Jungle without needing Watt.
  - When playing with Open Whale, the Fuzzipede check is not visible.

### 🔄 Layout updates
- The "Counters" header and grids have been removed.
  - Cheato quizzes answered and Rip Cheato deals purchased have been removed.
  - The Star Pieces counter has been moved next to the Ultra Stone.

### 📰 Documentation
- Updates the README with information on the tracker's settings and what each icon means.

### 🧹 Chores
- Removes unused function `fast_bowser_skipped_checks`, this is handled by the Fast Bowser setting.

## [v0.8.0] - 2022-05-11
### ➕ Checks and logic for
- Toad Town
  - Added missing mailbag turn-in.
- Chapter 8
  - Bowser's Castle

### 🔄 Check updates
- Moved shops to be children of their parent dungeon.
  - Allows access rules of the parent dungeon to be applied to the shops.
  - No user facing changes.
- Boo's Mansion
  - Removed duplicate panel check.
- Jade Jungle
  - Trees along the long beach no longer clear as a group.

### 🔧 Check Fixes
- Toad Town
  - Removes a non-existent check in MAC_05.
- Toad Town Tunnels
  - Standardized B3 ? block coinsanity checks.
- Pleasant Path
  - Standardizes the name of a ground item check.
- Koopa Village
  - Added missing Kolorado Artifact turn-in.
- Dry Dry Desert
  - Corrected grid location in names of two checks.
- Dry Dry Ruins
  - 3rd sand drain pit item can now be collected by draining the sand.
- Tubba Blubba's Castle
  - Spike room now requires two keys and Bow or Lakilester.
- Shy Guy's Toybox
  - Removes Star Piece icon from check that's not a panel.
  - CHanges capture on 3rd Peach's choice check to nothing since it can be viewed in the cutscene.
- Jade Jungle
  - Access rules now check correctly for either warp 3 or `can_ride_whale()`.
  - Removes a non-existent check in JAN_04.
  - Standardizes the name of a ground item check.
- Crystal Palace
  - Added Ultra Boots as required for two ? blocks past the second mirror gap.

### 🔄 Item updates
- Goombario is now collected by default.  Players using randomized starting partner can right-click Goombario to un-collect him.

### 🔄 Logic updates
- Blue House can now be opened from the outside.
- Toad Town Tunnels
  - Location based access rules are now applied correctly in B2.
- Mt. Rugged
  - Now requires Parakarry for the ring of coins in IWA_03.
- Dry Dry Desert
  - Removes `flag_raised_ruins`, it adds no value and disguises multiple checks behind one.
- Boo's Mansion
  - Mansion Shop now correctly checks for the weight.
  - Now requires Parakarry to cross the library shelf gap.
- Gusty Gulch
  - Now requires Parakarry for the ? Blocks in ARN_04
- Tubba Blubba's Castle
  - Now requires Parakarry to access.
- Shy Guy's Toybox
  - Require pulling the pink lever for checks past the Pink Station.
- Jade Jungle
  - Groups checks accessible after saving the Yoshi kids into a location.

### ➕ Layout additions
- Added extended items only tracker
  - For players that don't need an entire map, but want to track most key items.
  - The default map tracker's broadcast view has been updated to use the extended items only tracker.

### 🔄 Layout updates
- Added Bowser's castle key to the keys grid.

### 🔄 Script updates
- New: `can_hit_ground_blocks()`
  - Ground blocks can be activated with a hammer, super boots, Kooper, or Bombette.
  - Simplifies the access rules for all ground blocks.
- Updated: `can_access_blue_house()`
  - Now checks for having the Odd Key vs the flag.

### 🔧 Setting fixes
- Removed cross from Yoshi Village start setting icon.

### 🧹 Chores
- Fixes name of `__regionID` for Tubba Blubba's Castle.

## [v0.7.0] - 2022-05-04
### ➕ Checks and logic for
- Chapter 7
  - Shiver Mountain
  - Crystal Palace

### 🔄 Check updates
- Flag Refactoring - Chapters 2, 4, and 5
  - Removed and updated unnecessary flags.
    - `NOK_14`: building the bridge with Kooper
    - `OMO_08`: solving the color box puzzle
    - `JAN_06`: moving the raven statue
  - These flags added no additional logic to the tracker.
  - They added more player effort by requiring extra clicks.
  - They disguised multiple checks behind one, making it seem like there are less checks available than in actuality.
- Jade Jungle
  - Changed `access_rules` of checks after moving the raven statue to reference a location instead of explicit codes.

### 🔧 Check Fixes
- Dry Dry Outpost
  - Added image for Moustafa.

### ➕ Script additions
- New `partner()` script
  - Checks if Always Active Partners is enabled before checking if the partner has been collected.
  - Simplifies `access_rules` for Always Active Partners.
  - `access_rules` should be a bit more readable across the pack.

### 📰 Documentation
- `CONTRIBUTING.md`
  - Advises contributors that the guide assumes you have a working `git` install.
  - Provides links to install `git` and Github's Git Guides.
  - Adds context around 72 character line wrapping in commit message example.

### 🧹 Chores
- Add debug overlay images for testing progressive items that use a placeholder image for multiple steps.

## [v0.6.0] - 2022-04-11
### 🔄 Check updates
- Jade Jungle
  - Save Yoshi Kids Gift now checks correct flags for accessibility.

### 🔄 Layout updates
- Item Capture - Simplifies item capture popup by:
  - Removing star sprites (not randomized)
  - Swapping the Warehouse Key with a generic "Unknown Key" (players can't tell which key is actually behind a capturable check that uses the generic key sprite)
- Refactors required item section in the sidebar of the map tracker.  This brings it in line with the items only tracker, which flows better at the expense of vertical space.
- Settings popup
  - Adds Partners Always Active button to World Settings.
  - Breaks the World Settings tab into two lines:  top line is for general world settings, the second line is for the open chapter/area settings.
- `compact_right_item_grid`: corrected `item_margin`'s value, int -> string.
- Cleaned up unused grids from the layouts.

## [v0.5.0] - 2022-04-09
### ➕ Checks and logic for
- Chapter 6
  - Flower Fields
  - Cloudy Climb

### ➕ Support for
- Open Flower Gate

### 🔄 Check updates
- Peach's Castle Grounds
  - Added: Hijacked Peach's Castle Entrance - Hidden ? Block
- Toad Town
  - Updates Flower Gate flag name and codes to align with other flags.

### 📰 Documentation
- `CONTRIBUTING.md`: Clarifies commit header and updates scopes.

### 🧹 Chores
- `semantic.json`: Standardizes scopes

## [v0.4.0] - 2022-04-08
### ➕ Checks and logic for
- Chapter 5
  - Jade Jungle
  - Yoshi Village
  - Mt. Lavalava

### 📰 Documentation
- Adds a `CONTRIBUTING.md` file to help people new to contributing.

### 🧹 Chores
- Sets up repo Infrastructure as Code with `.github/settings.yml`.
- Sets up Semantic commit messages with `.github/semantic.yml`.
- Adds an [`.editorconfig` file](https://editorconfig.org/) to standardize formatting. (mostly helps Github Web UI users)

## [v0.3.0] - 2022-04-03
### ➕ Additional support for
- Partner abilities being always active.

### 🔄 Check updates
- Toad Town Tunnels
  - Chapter 5 warp check now toggles correct tracker flag.
- Koopa Village
  - Short name for shop items now displays correctly.
- Mt. Rugged
  - Adds logic for turning in letters to Parakarry for his partner quest.
- Shy Guy's Toybox
  - Color Box Puzzle now is in logic when you have the **Dictionary** and **Mystery Note**, without needing to set the tracker flag turning them in. (Russ T. in Toad Town - this may change if the color box puzzle's solution is randomized)
  - Checks for each station are indicated with the station's color.

### 🔄 Item updates
- Koopa Koot
  - Autograph items have been further optimized for ChatHUD: now can be toggled with `lauto` and `mauto`, for Luigi's and Merluvlee's autograph, respectively. (Randomizer has NYI Koopa Koot checks)

### 🔄 Layout updates
- Settings
  - Tracker settings are now contained in a popup - click the gear in the Star Spirits / Partners header.
- Condensed Star Spirits and partners into one header.

## [v0.2.0] - 2022-03-26
### ➕ Checks and logic for
- Chapter 4
  - Shy Guy's Toybox

### ➕ Support for
- Partner abilities being always active.

### 🔄 Check updates
- Boss battle check icons are now the Star Spirit card you would collect after the fight.

### 🌎 Map Updates
- Adds new map to allow separating Chapter 4 checks, as Toybox is incredibly dense.

## [v0.1.1] - 2022-03-24
### ➕ Checks and logic for
- Chapter 3
  - Forever Forest
  - Boo's Mansion
  - Gusty Gulch
  - Tubba Blubba's Castle

  ### ➕ Additional support for
- Shopsanity (as checks for regions are added)
- Coinsanity (as checks for regions are added)

## [v0.1.0] - 2022-03-22
### ➕ Added
- This CHANGELOG!
- Capturing items

### ➕ Checks and logic for
- Mt. Rugged
- Dry Dry Desert
- Dry Dry Outpost
- Dry Dry Ruins

### ➕ Support for
- Dry Dry Outpost starting location

### ➕ Additional support for
- Shopsanity (as checks for regions are added)
- Coinsanity (as checks for regions are added)

### ➕ Capturing items
- If you can see a check, but can't pick it up, this will allow you to mark the location with what the check contains.
- For example, the star piece in Toad Town across the water by the gate is a capturable check.
- Currently, only key items are capturable, other "priority" items will be added to the capture layout in the future. (maybe the hinted badges...? lmk!)

### 🔄 Item updates
- Added the Cookbook (was missing, whoops!)

### 🔄 Check updates
- Koopa Bros. Fortress: splits cracked walls in central hall to allow both to be captured
- Marked WIP or NYI settings with an X to indicate they do not function.
- Adds ability to exclude Star Piece Panels (not sure how I forgot this either)
- Panel checks now have a star piece icon to show their vanilla item.

### 🧹 Chores
- `images/flag/flagBlooper*.png`: removed images, tracker logic no longer relies on this flag
- `logic_helpers.lua`: added documentation comments

## [v0.0.7] - 2022-03-20
### ➕ Checks and logic for
- Shooting Star Summit
- Koopa Region
- Koopa Bros. Fortress

### ➕ Additional support for
- Shopsanity (as checks for regions are added)
- Coinsanity (as checks for regions are added)

### 🔧 Script fixes
- `can_access_star_haven()`: fixes reading incorrect setting
- `can_access_star_haven()`: returns earlier when configured for 0 spirits

## [v0.0.5] - 2022-03-19
### ➕ Added
- Broadcast view/ChatHUD
- Minimal, items only tracker
- More icons

### ➕ Checks and logic for
- Peach's Castle [WIP]
- Shooting Star Summit [WIP]
- Dojosanity

### ➕ Additional support for
- Configurable Star Spirit requirement
- Hidden block Watt requirement
- Shopsanity (as checks for regions are added)
- Coinsanity (as checks for regions are added)

### 🔄 Logic refactor
- More succinctly checks for Toad Town access

### 🧹 Chores
- All Files: newlines at EOF, because [a line isn't a line without \n](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_206)
- `location/world.json`: groups Toad Town checks by internal map ID

## [v0.0.3] - 2022-03-18
### ➕ Added
- A placeholder README
- A large map
- Initial layouts

### ➕ Initial data load of
- Star Spirits
- Partners
- Equipment
- Key Items
- Dungeon Keys
- Other Items
- Counters
- Settings

### ➕ Checks and logic for
- Goomba Region
- Toad Town
- Toad Town Tunnels

### ➕ Initial support for
- Starting location selection - Toad Town and Goomba Village

[v0.9.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.1.1...v0.2.0
[v0.1.1]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.0.7...v0.1.0
[v0.0.7]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.0.5...v0.0.7
[v0.0.5]: https://github.com/IcySlurpee/pmr_map_tracker/compare/v0.0.3...v0.0.5
[v0.0.3]: https://github.com/IcySlurpee/pmr_map_tracker/tree/v0.0.3
