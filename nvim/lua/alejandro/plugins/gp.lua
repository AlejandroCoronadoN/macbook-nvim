-- plugins/gp.lua
require('gp').setup({
    openai_api_key = os.getenv("OPENAI_API_KEY"),  -- Ensure you have your OpenAI API key set as an environment variable
    -- You can add more configuration options here as needed
  })
  