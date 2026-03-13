#Requires AutoHotkey v2.0

; 鼠标移到桌面右下角预览桌面
; 设置右下角的触发区域（像素）
CornerSize := 20
; 设置延迟时间，避免误触发
DelayTime := 200

; 监测鼠标位置
SetTimer(CheckMouseCorner, 100)

CheckMouseCorner() {
    global CornerSize, DelayTime
    static IsShowingDesktop := false
    static LastCornerTime := 0

    MouseGetPos(&MouseX, &MouseY)
    ScreenWidth := A_ScreenWidth
    ScreenHeight := A_ScreenHeight

    ; 检查鼠标是否在右下角
    InCorner := (MouseX >= ScreenWidth - CornerSize) && (MouseY >= ScreenHeight - CornerSize)

    if (InCorner && !IsShowingDesktop) {
        CurrentTime := A_TickCount
        ; 确保鼠标在角落停留足够时间才触发
        if (CurrentTime - LastCornerTime >= DelayTime) {
            Peek(1)
            IsShowingDesktop := true
        }
    }
    else if (!InCorner && IsShowingDesktop) {
        Peek(0)
        IsShowingDesktop := false
        LastCornerTime := A_TickCount
    }
    else if (InCorner) {
        LastCornerTime := A_TickCount
    }
}

; https://www.autohotkey.com/boards/viewtopic.php?f=76&t=15189&p=78662#p78662
Peek(on) {
    static dwmapi := 0, dwmpeek
    if !dwmapi {
        dwmapi := DllCall("LoadLibrary", "str", "dwmapi.dll", "ptr")
        dwmpeek := DllCall("GetProcAddress", "ptr", dwmapi, "ptr", 113, "ptr")
    }
    DllCall(dwmpeek, "int", on, "ptr", 0, "ptr", 0, "uint", 1, "ptr", 0)
}
