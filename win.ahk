#Requires AutoHotkey v2.0
#Include common.ahk

; Windows 操作系统上的设置

; 将 Caps 按键映射到 Shift
CapsLock::Shift

; 使用 Alt + Q 退出当前窗口
!q::
{
    ToolTip("又差点关闭窗口")
    Sleep(1000)
    ToolTip()
    ; WinClose('A')
}

; Shift + 鼠标移动实现横向滚动
~Shift & WheelUp:: Send("{Left}")  ; 按住 Shift 并向上滚动滚轮时向左滚动
~Shift & WheelDown:: Send("{Right}") ; 按住 Shift 并向下滚动滚轮时向右滚动

;任务栏音量
#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp:: Send "{Volume_Up 5}"
WheelDown:: Send "{Volume_Down 5}"
MButton:: Send "{Volume_Mute}"
#HotIf

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

; POT 划词翻译
#q::+!q

; Terminal
terminal := "ahk_exe WindowsTerminal.exe"
#T:: {
    if (!Trigger(terminal)) {
        WinActivate(terminal)
    }
}

; RWIN for task manager
RWin::
{
    Run("Taskmgr.exe")
}
