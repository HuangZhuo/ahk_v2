#Requires AutoHotkey v2.0

; Trigger zone size at the bottom-right corner (in pixels)
CornerSize := 20
; Delay to avoid accidental triggers (milliseconds)
DelayTime := 200

; Always use absolute screen coordinates for corner hit-testing.
CoordMode("Mouse", "Screen")
SetTimer(CheckMouseCorner, 100)

CheckMouseCorner() {
    global CornerSize, DelayTime
    static IsShowingDesktop := false
    static LastCornerTime := 0

    MouseGetPos(&MouseX, &MouseY)
    ScreenWidth := A_ScreenWidth
    ScreenHeight := A_ScreenHeight

    InCorner := (MouseX >= ScreenWidth - CornerSize) && (MouseY >= ScreenHeight - CornerSize)

    if (InCorner && !IsShowingDesktop) {
        CurrentTime := A_TickCount
        if (CurrentTime - LastCornerTime >= DelayTime) {
            WinMinimizeAll()
            IsShowingDesktop := true
        }
    }
    else if (!InCorner && IsShowingDesktop) {
        WinMinimizeAllUndo()
        IsShowingDesktop := false
        LastCornerTime := A_TickCount
    }
    else if (InCorner) {
        LastCornerTime := A_TickCount
    }
}
