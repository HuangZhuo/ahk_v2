/************************************************************************
 * @description Work in White Moon Tech
 * @author Joezme
 * @date 2024/12/04
 * @version 0.0.0
 ***********************************************************************/

#Requires AutoHotkey v2.0
#SingleInstance Force
#include common.ahk

if NOT WinActive("ahk_exe Obsidian.exe") {

    ; 激活客户端窗口
    !c:: {
        edge_client := "Cocos Creator - client"
        if !Trigger(edge_client) {
            ToolTip("没有运行的客户端")
            Sleep(1000)
            ToolTip()
        }
    }

    ; 激活UI编辑器
    !u:: {
        cocos := "ahk_exe CocosCreator.exe"
        Trigger(cocos)
    }

    ; 激活 VS Code
    !x:: {
        code := "ahk_exe code.exe"
        Trigger(code)
    }

    ; 激活 Trae
    !v:: {
        trae := "ahk_exe Trae CN.exe"
        Trigger(trae)
    }

    ; 打开微信
    !w::^!w
    ; !w:: {
    ;     SendInput('^!w')
    ; }

    ; 打开钉钉/企业微信
    ; !d::+!s ;直接在应用中设置
}
