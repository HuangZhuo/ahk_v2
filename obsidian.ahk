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
    :*o:]er::> [{!}error] ` ;error
    :*o:]b::> [{!}bug] ` ;bug
    :*o:]ex::> [{!}example] ` ;example
    :*o:]q::> [{!}quote] ` ;quote
}
