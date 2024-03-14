--- STEAMODDED HEADER
--- MOD_NAME: Hanafuda Hybrid
--- MOD_ID: HanafudaHybrid
--- MOD_AUTHOR: [Shirou97]
--- MOD_DESCRIPTION: Turns the regular set of playing cards into hybrid hanafuda cards, and adjusts their base chip value accordingly.

----------------------------------------------
------------MOD CODE -------------------------

local Card_set_base_ref = Card.set_base
function Card:set_base(card, initial)
    Card_set_base_ref(self, card, initial)

    if self.base.value == 'Ace' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 20
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == '2' or self.base.value == '4' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 10
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 5 end
    elseif self.base.value == '3' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 20
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == '5' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 10
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == '6' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 10
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == '7' or self.base.value == '9' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 10 end
    elseif self.base.value == '8' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 20
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 10
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == '10' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 10
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 1 end
    elseif self.base.value == 'Jack' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 20
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 5
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 10 end
    elseif self.base.value == 'Queen' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 1
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 20 end
    elseif self.base.value == 'King' then
        if self.base.suit == 'Spades' then self.base.nominal_chips = 0
        elseif self.base.suit == 'Hearts' then self.base.nominal_chips = 0
        elseif self.base.suit == 'Clubs' then self.base.nominal_chips = 0
        elseif self.base.suit == 'Diamonds' then self.base.nominal_chips = 0 end
    end
end

local Card_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil,nil

    if not self.bypass_lock and self.config.center.unlocked ~= false and
    (self.ability.set == 'Joker' or self.ability.set == 'Edition' or self.ability.consumeable or self.ability.set == 'Voucher' or self.ability.set == 'Booster') and
    not self.config.center.discovered and 
    ((self.area ~= G.jokers and self.area ~= G.consumeables and self.area) or not self.area) then
        card_type = 'Undiscovered'
    end
    if self.config.center.unlocked == false and not self.bypass_lock then --For everyting that is locked
        return Card_generate_UIBox_ability_table(self)
    elseif card_type == 'Default' or card_type == 'Enhanced' then
        loc_vars = { playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour,
                    nominal_chips = self.base.nominal > 0 and self.base.nominal_chips or nil,
                    bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
                }
    else return Card_generate_UIBox_ability_table(self)
    end
    local badges = {}
    if card_type ~= 'Default' or self.debuff then
        badges.card_type = card_type
    end
    if self.edition then
        if self.edition.type == 'negative' and self.ability.consumeable then
            badges[#badges + 1] = 'negative_consumable'
        else
            badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
        end
    end
    if self.seal then badges[#badges + 1] = string.lower(self.seal)..'_seal' end
    if self.ability.eternal then badges[#badges + 1] = 'eternal' end
    if self.pinned then badges[#badges + 1] = 'pinned_left' end

    if self.sticker then loc_vars = loc_vars or {}; loc_vars.sticker=self.sticker end

    return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
end

function Card:get_chip_bonus()
    if self.debuff then return 0 end
    if self.ability.effect == 'Stone Card' then
        return self.ability.bonus + (self.ability.perma_bonus or 0)
    end
    return self.base.nominal_chips + self.ability.bonus + (self.ability.perma_bonus or 0)
end

----------------------------------------------
------------MOD CODE END----------------------