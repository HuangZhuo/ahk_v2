/************************************************************************
 * @description Work in White Moon Tech
 * @author Joezme
 * @date 2024/12/04
 * @version 0.0.0
 ***********************************************************************/

#Requires AutoHotkey v2.0
#SingleInstance Force

if NOT WinActive("ahk_exe Obsidian.exe") {

    ; 激活客户端窗口
    !c:: {
        edge_client := "Cocos Creator - client - 个人 - Microsoft​ Edge"
        if WinActive(edge_client) {
            WinMinimize
        } else if WinExist(edge_client) {
            WinActivate
        } else {
            ToolTip("没有运行的客户端")
            Sleep(1000)
            ToolTip()
        }
    }

    ; 激活UI编辑器
    !u:: {
        cocos := "ahk_exe CocosCreator.exe"
        if WinActive(cocos) {
            WinMinimize
        } else if (WinExist(cocos)) {
            WinActivate
        }
    }

    ; 打开微信
    !w::^!w
    ; !w:: {
    ;     SendInput('^!w')
    ; }

    ; 打开钉钉/企业微信
    ; !d::+!s ;直接在应用中设置
}
