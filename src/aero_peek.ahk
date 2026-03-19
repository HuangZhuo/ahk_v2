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

Peek(on) {
    static ActiveMode := ""

    if (on) {
        if DwmPeek(1) {
            ActiveMode := "dwm"
            return
        }

        WinMinimizeAll()
        ActiveMode := "minall"
        return
    }

    if (ActiveMode = "dwm") {
        if !DwmPeek(0) {
            WinMinimizeAllUndo()
        }
    }
    else if (ActiveMode = "minall") {
        WinMinimizeAllUndo()
    }

    ActiveMode := ""
}

DwmPeek(on) {
    static Inited := false
    static Fn := 0

    if !Inited {
        hDwm := DllCall("GetModuleHandle", "str", "dwmapi.dll", "ptr")
        if !hDwm {
            hDwm := DllCall("LoadLibrary", "str", "dwmapi.dll", "ptr")
        }

        if hDwm {
            ; Prefer name lookup first, then fallback to ordinal 113 from old forum snippets.
            Fn := DllCall("GetProcAddress", "ptr", hDwm, "astr", "DwmpActivateLivePreview", "ptr")
            if !Fn {
                Fn := DllCall("GetProcAddress", "ptr", hDwm, "ptr", 113, "ptr")
            }
        }
        Inited := true
    }

    if !Fn {
        return false
    }

    ; HRESULT: non-negative means success.
    hr := DllCall(Fn, "int", on ? 1 : 0, "ptr", 0, "ptr", 0, "uint", 1, "ptr", 0, "int")
    return (hr >= 0)
}
