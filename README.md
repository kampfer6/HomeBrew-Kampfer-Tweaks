## Requirements
This mod requires:
1. [Compatibility Framework](https://www.nexusmods.com/baldursgate3/mods/1933). This should be at the bottom of your load order
2. [Community Library](https://www.nexusmods.com/baldursgate3/mods/1333). Transitive dependency from Compatibility Framework
3. [Home Brew - Comprehensive Reworks](https://www.nexusmods.com/baldursgate3/mods/9052). As of this version, this mod will work without it and will dynamically patch your feats and longbows no matter what your load order is. However, this mod is planned as an add-on for Home Brew and new features will be developed with the implication that you are a Home Brew player, therefore compatibility with vanilla or other load orders will not be guaranteed.

## Load order
Load this mod as low as possible. Ideally Home Brew should be as low as possible in your load order, followed by whatever difficulty add-ons you use, unofficial add-ons (those not from Haven) and followed by this.

## What is this?

This is an add-on for the [Home Brew - Comprehensive Reworks](https://www.nexusmods.com/baldursgate3/mods/9052) overhaul by Haven. 
+ It will dynamically patch an option to pick +2 ASI to every feat you have
+ It will patch every longbow in your load order to use Strength modifier for Attack Rolls, if the Strength of your character is more beneficial than Dexterity

**Q: But there are already mods that do that, aren't there?**

**A:** True, but the selling point of this mod is that it uses ScriptExtender to perform those patches dynamically. Rather than manually overwrite every statblock or 
every feat and risking breakage or inconsistency depending on the load order or on the future updates that Haven might do to HomeBrew, this version should be
more future-proof.

Meaning that it doesn't matter how the feats and Longbows defined, what mod defines them, etc. It wouldn't matter if Haven suddenly decided to add 20 new feats
or overwrite vanilla ones in some different way. It wouldn't matter if you pulled a mod that adds 200 new longbows to your load order (at least when it comes
to this patch, anyway. Adding extra items in other mods will most likely come with them being unbalanced or inconsistent with Home Brew.
