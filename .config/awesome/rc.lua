defaults = {}
defaults.windowTitle = 'Termit'
defaults.tabName = 'Terminal'
defaults.encoding = 'UTF-8'
defaults.wordChars = '+-AA-Za-z0-9,./?%&#:_~'
defaults.font = 'Monospace 11'
--defaults.foregroundColor = 'gray'
--defaults.backgroundColor = 'black'
defaults.showScrollbar = true
defaults.transparency = 0.2
defaults.hideSingleTab = false
defaults.hideMenubar = false
defaults.fillTabbar = false
defaults.scrollbackLines = 4096
defaults.geometry = '80x24'
defaults.allowChangingTitle = false
--defaults.changeTitle = function (title)
--    print('title='..title)
--    newTitle = 'Termit: '..title
--    return newTitle
--end
setOptions(defaults)

-- Tango Color Theme
colormap = {'#2e2e34343636', '#cccc00000000', '#4e4e9a9a0606', '#c4c4a0a00000', '#34346565a4a4', '#757550507b7b', '#060698209a9a', '#d3d3d7d7cfcf', '#555557575353', '#efef29292929', '#8a8ae2e23434', '#fcfce9e94f4f', '#72729f9fcfcf', '#adad7f7fa8a8', '#3434e2e2e2e2', '#eeeeeeeeecec'}
-- Zenburn Color Theme
colormap={'#1e2320', '#705050', '#60b48a', '#dfaf8f', '#b8c2cb', '#dc8cc3', '#486858', '#dcdccc', '#709080' ,'#dca3a3', '#c3bf9f', '#f0dfaf', '#94bff3', '#ec93d3', '#93e0e3', '#ffffff'}
setColormap(colormap)

matches = {}
matches['http.*'] = function (url) print('Matching url: '..url) end
setMatches(matches)

bindKey('Alt-Right', nextTab)
bindKey('Alt-Left', prevTab)
bindKey('Ctrl-2', function () print('Hello2!') end)
bindKey('Ctrl-3', function () print('Hello3!') end)
bindKey('Ctrl-3', nil) -- remove previous binding

setKbPolicy('keysym')

bindMouse('DoubleClick', openTab)

function printTable(tbl, indent)
    for p in pairs(tbl) do
        if type(tbl[p]) == 'table' then
            print(indent..p..':')
            local_indent = indent..'  '
            printTable(tbl[p], local_indent)
        else
            print(indent..tostring(p)..'='..tostring(tbl[p]))
        end
    end
end
-- 
userMenu = {}
mi = {}
mi.name = 'Close tab'
mi.action = closeTab
table.insert(userMenu, mi)

mi = {}
mi.name = 'New tab name'
mi.action = function () setTabTitle('New tab name') end
table.insert(userMenu, mi)

mi = {}
mi.name = 'Zsh tab'
mi.action = function ()
    tabInfo = {}
    tabInfo.title = 'Zsh tab'
    tabInfo.command = 'zsh'
    tabInfo.encoding = 'UTF-8'
    tabInfo.workingDir = '/tmp'
    openTab(tabInfo)
end
table.insert(userMenu, mi)

mi = {}
mi.name = 'set red color'
mi.action = function () setTabForegroundColor('red') end
table.insert(userMenu, mi)

mi = {}
mi.name = 'Reconfigure'
mi.action = reconfigure
--mi.accel = 'Ctrl-r'
table.insert(userMenu, mi)

mi = {}
mi.name = 'Selection'
mi.action = function () print(selection()) end
table.insert(userMenu, mi)

mi = {}
mi.name = 'Get tab info'
mi.action = function ()
    tab = tabs[currentTabIndex()]
    if tab then
        print(tab)
        printTable(tab, '')
    end
end
table.insert(userMenu, mi)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1)..(tab.fontSize + delta))
end

mi = {}
mi.name = 'Increase font size'
mi.action = function () changeTabFontSize(1) end
table.insert(userMenu, mi)

mi = {}
mi.name = 'Decrease font size'
mi.action = function () changeTabFontSize(-1) end
table.insert(userMenu, mi)

mi = {}
mi.name = 'User quit'
mi.action = function () quit() end
table.insert(userMenu, mi)

--printTable(userMenu, '')

-- list of available encodings
encodings = {'UTF-8', 'KOI8-R', 'CP1251', 'CP866'}

addMenu(userMenu, "User menu")
addPopupMenu(userMenu, "User menu")

encMenu = {}

for i, e in pairs(encodings) do 
    mi = {}
    mi.name = e
    mi.action = function () setEncoding(e) end
    table.insert(encMenu, mi)
end
addMenu(encMenu, "Encodings")
addPopupMenu(encMenu, "Encodings")


