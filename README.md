## Hanafuda hybrid deck mod for Balatro.

A mod for [Balatro](https://store.steampowered.com/app/2379780/Balatro/) which changes the standard poker deck to a hybrid deck where each poker card is associated with a corresponding hanafuda card.

Use with [Steamodded](https://github.com/Steamopollys/Steamodded/). **Warning: work in progress. Use at your own risk.**

The deck works as follows: each rank corresponds to a hanafuda month, e.g. Aces to January, 2s to February etc. except the Kings which aren't associated to any month as there are only 12 months and 48 cards in the standard hanafuda deck.

The cards base chips values are also modified to correspond to the hanafuda values (brights = 20 points, seeds = 10 points, ribbons = 5 points, and chaff = 1 point). The Kings are (for now) worth 0 points.

Instead of putting all the high value cards in the same suit like a typical deck would do, each month has been carefully arranged so that each suit contains the same number of points (i.e. 66). The full table is given below.

| Rank | Month | Spades | Hearts | Clubs | Diamonds |
| :---: | --- | :---: | :---: | :---: | :---: |
| A | January | 20 (Crane) | 1 | 5 (Poetry Ribbon) | 1 |
| 2 | February | 1 | 10 (Warbler) | 1 | 5 (Poetry Ribbon) |
| 3 | March | 5 (Poetry Ribbon) | 1 | 20 (Curtain) | 1 |
| 4 | April | 1 | 10 (Cuckoo) | 1 | 5 (Ribbon) |
| 5 | May | 5 (Ribbon) | 1 | 10 (Bridge) | 1 |
| 6 | June | 1 | 10 (Butterflies) | 5 (Blue Ribbon) | 1 |
| 7 | July | 5 (Ribbon) | 1 | 1 | 10 (Boar) |
| 8 | August | 1 | 20 (Full Moon) | 10 (Geese) | 1 |
| 9 | September | 5 (Blue Ribbon) | 1 | 1 | 10 (Sake Cup) |
| 10 | October | 1 | 5 (Blue Ribbon) | 10 (Deer) | 1 |
| J | November | 20 (Rainman) | 5 (Ribbon) | 1 | 10 (Swallow) |
| Q | December | 1 | 1 | 1 | 20 (Phoenix) |
| K | None | 0 | 0 | 0 | 0 |

### Progression

Done:
- Modified cards base chips values

To do:
- Modify sprites to add hanafuda art
- Add custom jokers to spice things up

Possible improvements:
- Add badges to the cards UI which tell you what category a card is (bright, seed, ribbon, chaff)
- Add custom hands corresponding to the common yakus (idea stolen from [Crimson Heart's own hanafuda mod project](https://discord.com/channels/1116389027176787968/1210976027036352582), this was not my original plan)
