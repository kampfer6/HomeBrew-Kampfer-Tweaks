## [Unreleased]

## [0.0.2] - 2025-11-22

### Changed

#### Titanstring Bow

+ **Titanstring Bow** retains it's *Titan Feller* passive on top of adaptively scaling from Strength or Dexterity like every
other patched longbow, meaning that if you have high Strength, your Strength modifier is added twice to attack rolls and damage
+ **Titanstring Bow** additionally gains a passive that can knock anyone shot by it prone if they fail a Strength saving throw
This was the same passive originally implemented by [darkynho](https://www.nexusmods.com/baldursgate3/users/118560738) in his
Longbow patch, except I made it use the Combat Maneuver Save DC (Strength or Dex) rather than Spellcasting Ability save DC
+ **Titanstring Bow** rarity was bumped to *Very Rare* from *Rare* and it's attunement cost bumped from 2 to 4

I added the passive from [darkynho's](https://www.nexusmods.com/baldursgate3/users/118560738) implementation of the Longbow patch on top of the added scaling, because I thought it would make the item more interesting rather than simply being a bow that accurately hits hard. 

Considering it's upped attunement cost and the fact that other longbows would do even crazier things for you if you already have high hit chance (like shooting with Action/Bonus Action interchangably), I think it shouldn't be too much.

### Fixed

+ Fixed a Home Brew bug that caused *Titan Feller* to always add at least and additional +1 to your damage roll even if your Strength modifier is 0 or less

## [0.0.1] - 2025-11-22

### Added

+ You can now pull Compatibility Framework into a Home Brew load order without seeing classes that aren't meant to be in Home Brew
+ Implemented the Dynamic ASI +2 patch that will add +2 ASI to every feat that doesn't already have it 
(except any feat that provides an option to select from Home Brew ASI passive list)
+ Implemented the Dynamic Longbow Patch. Every longbow in the game will be patched to use Strength as an attack roll attribute
if the character's Strength is greater than their Dexterity
