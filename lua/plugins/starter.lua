return {
  "echasnovski/mini.starter",
  version = false,
  event = "VimEnter",
  config = function()
    local starter = require("mini.starter")

    starter.setup({
      header = [[
 _____ _____ _   ____  _________ _      _____ 
/  ___|_   _| | | |  \/  || ___ \ |    |  ___|
\ `--.  | | | | | | .  . || |_/ / |    | |__  
 `--. \ | | | | | | |\/| || ___ \ |    |  __| 
/\__/ / | | | |_| | |  | || |_/ / |____| |___ 
\____/  \_/  \___/\_|  |_/\____/\_____/\____/ 

           _   _ ________  ___            
          | | | |_   _|  \/  |            
          | | | | | | | .  . |            
          | | | | | | | |\/| |            
          \ \_/ /_| |_| |  | |            
           \___/ \___/\_|  |_/            

 "The most important step a man can take. 
  It's not the first one, is it?
  It's the next one. 
  Always the next step."                 

      -- Dalinar Kholin, Oathbringer
]],

      items = {
        starter.sections.recent_files(5, true),
        { name = "Find file", action = "Telescope find_files", section = "Actions" },
        { name = "Live grep", action = "Telescope live_grep", section = "Actions" },
        { name = "Open Oil", action = "Oil", section = "Actions" },
        { name = "New buffer", action = "enew", section = "Actions" },
        { name = "Quit", action = "qall", section = "Actions" },
      },

      content_hooks = {
        starter.gen_hook.adding_bullet("  "),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
