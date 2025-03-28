#Requires AutoHotkey v2.0
#SingleInstance Force

if WinActive("ahk_exe Obsidian.exe") {
    ; obsidian callouts
    :*o:]n::> [{!}note] ` ;note
    ; :*o:]tl::> [{!}tldr] ` ;tldr
    :*o:]i::> [{!}info] ` ;info
    ; :*o:]ti::> [{!}tip] ` ;tip
    :*o:]f::> [{!}faq] ` ;faq
    :*o:]w::> [{!}warning] ` ;warning
    :*o:]e::> [{!}error] ` ;error
    :*o:]b::> [{!}bug] ` ;bug
    ; :*o:]ex::> [{!}example] ` ;example
    :*o:]q::> [{!}quote] ` ;quote
}

; 通过 #o 打开 Obsidian
#o:: {
    if !WinExist("ahk_exe Obsidian.exe") {
        Run('obsidian://open?vault=docs')
        Sleep(1000)
        WinActivate("ahk_exe Obsidian.exe")
    } else if WinActive("ahk_exe Obsidian.exe") {
        WinMinimize
    } else {
        WinActivate("ahk_exe Obsidian.exe")
    }
}
