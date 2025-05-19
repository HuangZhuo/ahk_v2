#Requires AutoHotkey v2.0

; 定义一个 Trigger 函数
Trigger(title) {
    if WinActive(title) {
        WinMinimize
        return true
    } else if WinExist(title) {
        WinActivate
        return true
    } else {
        return false
    }
}

MouseIsOver(WinTitle) {
    MouseGetPos , , &Win
    return WinExist(WinTitle " ahk_id " Win)
}
