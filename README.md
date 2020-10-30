## Applying the patch
[Download a release from this page](/ssbmars/ideal_EXE6_patch/releases).
Apply over a clean, unpatched copy of Rockman EXE6. It must be the Japanese version of the game, and it must not have any other patches applied.
Attempting to patch over a dirty copy of the ROM will result in an error, so you will know whether you applied it successfully.

## Patch Features
This contains only the functionality for applying ModCards. No other features from ideal_EXE's Taisen patch are included.

**ModCard Loader:** In Lan's room, interact with his computer to bring up the prompt that allows you to equip a ModCard.

**Detailed Confirmation Messages:** It will display which ModCard was equipped, or it will give an error message explaining why the ModCard was not equipped.
Supported reasons for a ModCard not being equipped:
- (Bad ID): The ID that was entered is outside the range of valid ModCard IDs.
- (Duplicate): The submitted ID is for a ModCard that is already equipped. Only 1 copy of a ModCard can be equipped.
- (Low MB): The new ModCard would cause your total MB count to exceed the limit of 80 if it were equipped, so it was not equipped. Enter the ModCard menu and remove equipped ModCards until you have enough MB available to equip the new card. 

**Reminders for Tournament Rules:** If a certain ModCard has an ability that is banned in tournaments, it can be flagged to display an additional message whenever it's equipped that warns the user about the specific ability that is banned.

