if not HopLib then
	return
end


if not TSDGAI then
    TSDGAI = {}
    TSDGAI.mod_path = ModPath
    TSDGAI.settings = {
        bot_health_multiplier = 1
    }

    TSDGAI.defaults_settings = deep_clone(TSDGAI.settings)
    TSDGAI.peer_settings = setmetatable({
		[1] = TSDGAI.settings
	}, {
		__index = function(t, k)
			t[k] = deep_clone(TSDGAI.default_settings)
			return t[k]
		end
	})

    TSDGAI.params = {
        bot_health_multiplier = {
            priority = 100,
            max = 2,
            divider = -16
        }
    }

    TSDGAI.menu_builder = MenuBuilder:new("schema", TSDGAI.settings, TSDGAI.params)

    Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusSchema", function(menu_manager, nodes)
		TSDGAI.menu_builder:create_menu(nodes)
	end)
    end