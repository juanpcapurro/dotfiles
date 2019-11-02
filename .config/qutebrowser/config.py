# force a different user agent to fix whatsapp web issue 
config.set('content.headers.user_agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36", 'https://web.whatsapp.com/*')

c.downloads.location.prompt = False
c.tabs.background = True
c.auto_save.session = True

# editor setting
c.editor.command = ["st", "-t", "i3_dropdown_quteditor","nvim", "-f", "{file}", "-c", "normal {line}G{column0}1"]

# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';m', 'hint links userscript ~/.scripts/mpvappend')
config.bind(';M', 'hint --rapid links userscript ~/.scripts/mpvappend')
# Bindings for insert mode
config.bind('<Ctrl-f>', 'open-editor','insert')
