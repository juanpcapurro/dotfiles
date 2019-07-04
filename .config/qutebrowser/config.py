# Disable javascript
config.set('content.javascript.enabled', False)
# javascript exceptions
for site in [ 'telegram.org', 'gitlab.com', 'whatsapp.com', 'atixlabs.com', 'myjetbrains.com','slack.com','youtube.com', 'duckduckgo.com', 'bitwarden.com', 'tinder.com', 'reddit.com']:
    config.set('content.javascript.enabled', True, '*://*.'+site+'/*')
for site in [ 'qute://*/*', 'chrome://*/*', 'file://*']:
    config.set('content.javascript.enabled', True, site)

# sites in which to allow tracking/ads
for site in ['tinder.com']:
    config.set('content.host_blocking.enabled', False, '*://*.'+site+'/*')

# force a different user agent to fix whatsapp web issue 
config.set('content.headers.user_agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36", 'https://web.whatsapp.com/*')

c.downloads.location.prompt = False
c.tabs.background = True

# editor setting
c.editor.command = ["st", "-t", "i3_dropdown_quteditor","nvim", "-f", "{file}", "-c", "normal {line}G{column0}1"]

# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';m', 'hint links userscript ~/.scripts/mpvappend')
config.bind(';M', 'hint --rapid links userscript ~/.scripts/mpvappend')
config.bind(';v', 'hint links userscript ~/.scripts/mpvideoappend')
config.bind(';V', 'hint --rapid links userscript ~/.scripts/mpvideoappend')
# Bindings for insert mode
config.bind('<Ctrl-e>', 'open-editor','insert')
