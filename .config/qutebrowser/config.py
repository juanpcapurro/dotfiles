config.set('content.javascript.enabled', False)
js_enabled_sites=['windguru.cz', 'twitter.com', 'mercadolibre.com.ar', 'instagram.com', 'etherscan.io', 'github.com', 'gitlab.com', 'paypal.com', 'youtube.com', 'edensa.com.ar']
for site in js_enabled_sites :
    config.set('content.javascript.enabled', True, '*://*.'+site+'/*')

c.downloads.location.prompt = False
c.tabs.background = True
c.auto_save.session = True

# editor setting
c.editor.command = ["st", "-t", "i3_dropdown_quteditor","nvim", "-f", "{file}", "-c", "normal {line}G{column0}1"]

config.set('url.searchengines', {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'ml': 'https://listado.mercadolibre.com.ar/{}'
})

# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';v', 'hint links userscript ~/.scripts/mpvappend')
config.bind(';V', 'hint --rapid links userscript ~/.scripts/mpvappend')
config.bind(';r', 'hint links userscript ~/.scripts/rssadd')
config.bind(';a', 'hint links userscript ~/.scripts/youtube-archive')
# Bindings for insert mode
config.bind('<Ctrl-f>', 'open-editor','insert')
config.load_autoconfig(False)
