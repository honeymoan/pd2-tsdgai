Hooks:PostHook(CriminalsManager, "init", "init_ub", function (self)
    local char_tweak = tweak_data.character

    if char_tweak then
        local preset = char_tweak.presets
        if preset then
            local char_damage = preset.gang_member_damage
            if char_damage then
                local multiplier = TSDGAI.settings.bot_health_multiplier
                local new_health = char_damage.HEALTH_INIT * multiplier
                char_damage.HEALTH_INIT = new_health or char_damage.HEALTH_INIT
            end
        end
    end
end)