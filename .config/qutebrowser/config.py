# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# editor setting
c.editor.command = ["st","-f", "SourceCodePro:pixelsize=17", "-t", "i3_dropdown_quteditor","nvim", "-f", "{file}", "-c", "normal {line}G{column0}1"]

# Bindings for normal mode
config.bind('e', 'open-editor')
config.bind(';m', 'hint links userscript ~/.scripts/mpvappend')
config.bind(';v', 'hint links userscript ~/.scripts/mpvideoappend')
config.bind(';V', 'hint --rapid links userscript ~/.scripts/mpvideoappend')
config.bind(';M', 'hint --rapid links userscript ~/.scripts/mpvappend')
# Bindings for insert mode
config.bind('<Ctrl-e>', 'open-editor','insert')
