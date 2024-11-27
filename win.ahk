#Requires AutoHotkey v2.0

; Windows 操作系统上的设置

; 将 Caps 按键映射到 Shift
CapsLock::Shift

; datetime input
:*:]d::
{
    CurrentDateTime := FormatTime("", "yyyy-MM-dd")
    SendInput(CurrentDateTime)
}

:*:]t::
{
    CurrentDateTime := FormatTime("", "yyyy-MM-dd HH:mm:ss")
    SendInput(CurrentDateTime)
}

; quote input
![::
{
    SendInput("「」{Left}")
}
    
^![::
{
    SendInput("『』{Left}")
}
