# vim: foldmethod=marker

# Enable/disable js {{{
config.set('content.javascript.enabled', False)
js_enabled_sites=['windguru.cz', 'twitter.com', 'mercadolibre.com.ar', 'instagram.com', 'etherscan.io', 'github.com', 'gitlab.com', 'paypal.com','edensa.com.ar', 'airbnb.com', 'openstreetmap.org', 'duckduckgo.com', 'thingiverse.com', 'thangs.com', 'old.reddit.com', 'www.reddit.com', 'mercadopago.com.ar', 'polygonscan.com', 'trello.com', 'npmjs.com', 'developer.mozilla.org']
for site in js_enabled_sites :
    config.set('content.javascript.enabled', True, '*://*.'+site+'/*')
# }}}

# Settings {{{
c.downloads.location.prompt = False
c.tabs.background = True
c.auto_save.session = True
config.set('content.user_stylesheets', ['~/.config/qutebrowser/styles.css'])
# editor setting
c.editor.command = ["urxvt", "-name", "qutebrowser-editor", "-e", "nvim", "-f", "{file}","+set filetype=markdown" , "+normal {line}G{column0}1"]
#}}}

# Search Engines {{{
config.set('url.searchengines', {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'sw': 'https://search.marginalia.nu/search?query={}&profile=default&js=default',
    'yt': 'https://inv.tux.pizza/search?q={}',
    'mdn': 'https://developer.mozilla.org/en-US/search?q={}',
    'lgf': 'https://libgen.is/fiction/?q={}',
    'lga': 'https://libgen.is/search.php?req={}',
    'tg': 'https://thangs.com/search/{}?scope=all',
    'ml': 'https://listado.mercadolibre.com.ar/{}',
    'npm': 'https://www.npmjs.com/search?q={}',
    'gh': 'https://github.com/search?q={}',
    'crates': 'https://crates.io/search?q={}',
    'ens': 'https://etherscan.io/enslookup-search?search={}'
})
#}}}

# Explorer bindings {{{
config.bind('peaM', 'open -- https://etherscan.io/address/{clipboard}')
config.bind('PeaM', 'open -- https://etherscan.io/address/{primary}')
config.bind('petM', 'open -- https://etherscan.io/tx/{clipboard}')
config.bind('PetM', 'open -- https://etherscan.io/tx/{primary}')

config.bind('peas', 'open -- https://sepolia.etherscan.io/address/{clipboard}')
config.bind('Peas', 'open -- https://sepolia.etherscan.io/address/{primary}')
config.bind('pets', 'open -- https://sepolia.etherscan.io/tx/{clipboard}')
config.bind('Pets', 'open -- https://sepolia.etherscan.io/tx/{primary}')

config.bind('peag', 'open -- https://goerli.etherscan.io/address/{clipboard}')
config.bind('Peag', 'open -- https://goerli.etherscan.io/address/{primary}')
config.bind('petg', 'open -- https://goerli.etherscan.io/tx/{clipboard}')
config.bind('Petg', 'open -- https://goerli.etherscan.io/tx/{primary}')

config.bind('peap', 'open -- https://polygonscan.com/address/{clipboard}')
config.bind('Peap', 'open -- https://polygonscan.com/address/{primary}')
config.bind('petp', 'open -- https://polygonscan.com/tx/{clipboard}')
config.bind('Petp', 'open -- https://polygonscan.com/tx/{primary}')

config.bind('peam', 'open -- https://mumbai.polygonscan.com/address/{clipboard}')
config.bind('Peam', 'open -- https://mumbai.polygonscan.com/address/{primary}')
config.bind('petm', 'open -- https://mumbai.polygonscan.com/tx/{clipboard}')
config.bind('Petm', 'open -- https://mumbai.polygonscan.com/tx/{primary}')
#}}}

# Bindings {{{
# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';v', 'hint links userscript /usr/bin/mpvappend')
config.bind(';V', 'hint --rapid links userscript /usr/bin/mpvappend')
config.bind(';r', 'hint links userscript /usr/bin/rssadd')
config.bind(';a', 'hint links userscript /usr/bin/youtube-archive')
config.bind(';sv', 'config-source')
# Bindings for insert mode
config.bind('<Ctrl-f>', 'open-editor','insert')
#}}}
config.load_autoconfig(False)
