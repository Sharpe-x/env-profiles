vim.g["codegpt_chat_completions_url"] = "https://openai-proxy.zsharpe.com/v1/chat/completions"

vim.g["codegpt_commands"] = {
  ["exp"] = {
    user_message_template = "Explain the following {{language}} code: ```{{filetype}}\n{{text_selection}}``` Explain it using Chinese as if you were explaining to another developer.",
    callback_type = "text_popup",
  },
  ["ts"] = {
    system_message_template = "You are a translation engine that can only translate text and cannot interpret it.",
    user_message_template = "translate this text to Chinese:\n {{text_selection}}",
    callback_type = "text_popup",
  },
  ["polish"] = {
    system_message_template = "Revise the following sentences to make them more clear, concise, and coherent.",
    user_message_template = "polish this text in English:\n {{text_selection}}",
    callback_type = "text_popup",
  },
  ["expand"] = {
    user_message_template = "I have the following {{language}} macro:```{{filetype}}\n{{text_selection}}```\nProvide example inputs to show the macro expansion's result as a code snippet and explain it using Chinese comments. Return only the code snippet. If it's not a macro, return an error message.",
    callback_type = "code_popup",
  },
}
