config.set('content.javascript.enabled', False)
js_enabled_sites=['windguru.cz', 'twitter.com', 'mercadolibre.com.ar', 'instagram.com', 'etherscan.io', 'github.com', 'gitlab.com', 'paypal.com', 'youtube.com', 'edensa.com.ar', 'airbnb.com', 'openstreetmap.org', 'duckduckgo.com', 'thingiverse.com', 'afip.gob.ar', 'old.reddit.com', 'piped.kavin.rocks']
for site in js_enabled_sites :
    config.set('content.javascript.enabled', True, '*://*.'+site+'/*')

c.downloads.location.prompt = False
c.tabs.background = True
c.auto_save.session = True

# editor setting
c.editor.command = ["st", "-t", "i3_dropdown_quteditor","nvim", "-f", "{file}", "-c", "normal {line}G{column0}1"]

config.set('url.searchengines', {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'yt': 'https://piped.kavin.rocks/results?search_query={}',
    'ml': 'https://listado.mercadolibre.com.ar/{}',
    'ens': 'https://etherscan.io/enslookup-search?search={}'
})

config.bind('peam', 'open -- https://etherscan.io/address/{clipboard}')
config.bind('Peam', 'open -- https://etherscan.io/address/{primary}')
config.bind('petm', 'open -- https://etherscan.io/tx/{clipboard}')
config.bind('Petm', 'open -- https://etherscan.io/tx/{primary}')

config.bind('peak', 'open -- https://kovan.etherscan.io/address/{clipboard}')
config.bind('Peak', 'open -- https://kovan.etherscan.io/address/{primary}')
config.bind('petk', 'open -- https://kovan.etherscan.io/tx/{clipboard}')
config.bind('Petk', 'open -- https://kovan.etherscan.io/tx/{primary}')

config.bind('peap', 'open -- https://polygonscan.com/address/{clipboard}')
config.bind('Peap', 'open -- https://polygonscan.com/address/{primary}')
config.bind('petp', 'open -- https://polygonscan.com/tx/{clipboard}')
config.bind('Petp', 'open -- https://polygonscan.com/tx/{primary}')

# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';v', 'hint links userscript ~/.scripts/mpvappend')
config.bind(';V', 'hint --rapid links userscript ~/.scripts/mpvappend')
config.bind(';r', 'hint links userscript ~/.scripts/rssadd')
config.bind(';a', 'hint links userscript ~/.scripts/youtube-archive')
# Bindings for insert mode
config.bind('<Ctrl-f>', 'open-editor','insert')
config.load_autoconfig(False)
