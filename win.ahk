#Requires AutoHotkey v2.0

; Windows 操作系统上的设置

; 将 Caps 按键映射到 Shift
CapsLock::Shift

; 使用 Alt + Q 退出当前窗口
!q::
{
    WinClose('A')
}

; 鼠标中键映射到多任务
; MButton::
; {
;     Send("#{Tab}")
; }

; 适应 Mac 的键盘布局
; LAlt::Ctrl
; LWin::Alt

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
