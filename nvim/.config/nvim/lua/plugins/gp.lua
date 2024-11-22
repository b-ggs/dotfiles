return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          endpoint = "https://api.x.ai/v1/chat/completions",
        },
      },
      agents = {
        {
          provider = "openai",
          name = "Grok Beta",
          chat = true,
          command = false,
          model = { model = "grok-beta" },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },
      default_chat_agent = "Grok Beta",
      default_command_agent = "Grok Beta",
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
