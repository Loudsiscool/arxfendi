#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\lib\DiscordBuilderAHK-0.0.1.1\DiscordBuilder.ahk
#Include %A_ScriptDir%\lib\AHKv2-Gdip-master\Gdip_All.ahk
#NoTrayIcon
#SingleInstance Force 
CoordMode "Mouse", "Screen"
SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
global UiBorders := []
global uiTheme := []

Ranger:="|<>*136$36.zzzzzzzzzzzzzzzzzzw7ka8zs3U20TE3020Akb2267lz72C7lz72C7kb22C7k302C7s3U2C7w7kaDDzzzzzzzzzzzzzzzzzzU"
UpgUI:="|<>*101$8.zzy1tyTbtyTzU"
AreasText:="|<>*111$16.zzzzzzwTy0zk1y07s0T01w0Dk0z07y0zyTzzzzzzU"
LoadingScreen:="|<>*79$59.zzzzzzzzzzzzzzzzzzzzsTzzzzzzzz0Tzztzzzzy0zzzlzzzzwPzzD3wzzzsyD841UM4DkCAE820k0DkAMXsQMW4TwA30tk1AMyQM71nk6MlwEsQnVXwlXs3ss730NX7sDnkT70naDzz7zzzzzzzzyTzzzzzzzzszzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzy"
VoteStart:="|<>*128$45.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzznz7zlzzwDkzyDzzlyDzlzzy7Vlw3szswM30A1z3W08107wMkVUMEzV6CCD67y1lllk0zkCCCD7zz3k1kM1zsT0S3UDzbw7wS1zzzzzzzzzzzzzzzzzzzzzzzU"
LobbyText:="|<>*145$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzwTzzzzzzzzXzzzzzzzzwTyDzyzz7zXz0Q0blUDwTk304S81zXy480XX27wTlV76AMkzXy0Msk70DwTlz670szzU64M0sD2Dw0M3U7Vw1zU3US8yTkDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
ImageSearchWrapper(&FoundX, &FoundY, X1, Y1, X2, Y2, ImagePath, Tolerance := 30) {
    try {
        ; Store the previous CoordMode and set to Screen
        prevCoordMode := A_CoordModePixel
        CoordMode "Pixel", "Screen"

        ; Perform the image search with specified tolerance
        result := ImageSearch(&FoundX, &FoundY, X1, Y1, X2, Y2, "*" Tolerance " " ImagePath)

        ; Restore previous CoordMode if needed
        if (prevCoordMode != "Screen")
            CoordMode "Pixel", prevCoordMode

        ; Return and log results
        if (result) {
            return true
        } else {
            return false
        }
    } catch as e {
        MsgBox("Error in ImageSearchWrapper: " e.Message)
        return false
    }
}

F1:: {
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Pulse Macros") {
        Sleep 50
        WinActivate("Pulse Macros")
        Sleep 100
    }
}

F2:: InitializeMacro()

InitializeMacro() {
    global MacroStartTime := A_TickCount

    if WinExist("Sleepy Auto-Challenge") {
        WinActivate("Sleepy Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000", )
        return
    }

    if (ok:=FindText(&X, &Y, 56-150000, 265-150000, 56+150000, 265+150000, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000", )
        return
    }
    
}

BetterClick(x, y, LR := "Left") {
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

; go to selected farm place

GoToRaids() {
    SendInput ("{Tab}")
    loop {
        ; go to xmas map
        if (ok:=FindText(&X, &Y, 434-150000, 322-150000, 434+150000, 322+150000, 0, 0, LoadingScreen)) {
            ProcessLog("Found LoadingScreen, stopping loop")
        }
        if (ok:=FindText(&X, &Y, 382-150000, 116-150000, 382+150000, 116+150000, 0, 0, VoteStart)) {
            ProcessLog("Found VoteStart, stopping loop")
            break
        }

    if (FarmSel.Text = "Story"){
        Sleep 200
        BetterClick(100, 370)
        Sleep 200
        BetterClick(100, 270)
        if(OptionSel.Text = "Voocha Village"){
            BetterClick(260, 220)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 220)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "4"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "5"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 320)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "6"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "7"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "8"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "9"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "10"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 330)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }

        } ; Voocha
        if(OptionSel.Text = "Green Planet"){
            BetterClick(260, 290)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 220)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "4"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "5"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 320)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "6"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "7"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "8"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "9"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "10"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 330)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }

        } ; Green 
        if(OptionSel.Text = "Demon Forest"){
            BetterClick(260, 350)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 220)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "4"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "5"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 320)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "6"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "7"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "8"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "9"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "10"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 330)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }

        } ; Demon
        if(OptionSel.Text = "Leaf Village"){
            BetterClick(260, 410)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 220)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "4"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "5"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 320)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "6"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "7"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "8"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "9"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "10"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 330)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }

        } ; Leaf
        if(OptionSel.Text = "Z City"){
            BetterClick(260, 440)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 220)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "4"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "5"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 320)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "6"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "7"){
                BetterClick(440, 230)
                SendInput("{WheelDown}")
                Sleep 200
                SendInput("{WheelDown}")
                Sleep 200
                BetterClick(440, 300)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "8"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 230)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "9"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 270)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }
            if (ExtraSel.Text = "10"){
                BetterClick(440, 230)
                loop 4{
                SendInput("{WheelDown}")
                Sleep 200
            }
                BetterClick(440, 330)
                Sleep 200
                if (RerollSel.Text = "Normal"){
                    BetterClick(550, 290)
                }
                if (RerollSel.Text = "Hard"){
                    BetterClick(600, 290)
                }
                if (RerollSel.Text = "Nightmare"){
                    BetterClick(650, 290)
                }
            }

        } ; Z City

        Sleep 200
            BetterClick(520, 450)
            Sleep 1000
            BetterClick(430, 510)

    } ; story

    if (FarmSel.Text = "Ranger Stages"){
        Sleep 200
        BetterClick(100, 370)
        Sleep 200
        BetterClick(100, 270)
        Sleep 200
        BetterClick(500, 510)
        Sleep 200
        if(OptionSel.Text = "Voocha Village"){
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 345)
                Sleep 200
            }
        } ; Voocha
        if(OptionSel.Text = "Green Planet"){
            BetterClick(260, 290)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 345)
                Sleep 200
            }
        } ; Green
        if(OptionSel.Text = "Demon Forest"){
            BetterClick(260, 350)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 345)
                Sleep 200
            }
        } ; Demon
        if(OptionSel.Text = "Leaf Village"){
            BetterClick(260, 410)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 345)
                Sleep 200
            }
        } ; Leaf
        if(OptionSel.Text = "Z City"){
            BetterClick(260, 450)
            if (ExtraSel.Text = "1"){
                BetterClick(440, 230)
                Sleep 200
            }
            if (ExtraSel.Text = "2"){
                BetterClick(440, 300)
                Sleep 200
            }
            if (ExtraSel.Text = "3"){
                BetterClick(440, 345)
                Sleep 200
            }
        }

        Sleep 200
        BetterClick(520, 450)
        Sleep 1000
        if (ok:=FindText(&X, &Y, 352-150000, 459-150000, 352+150000, 459+150000, 0, 0, Ranger)){
            ProcessLog("Ranger On Cooldown")
            if(AutoChallenge.Value = true){
                ProcessLog("Going to Challenge")
                return GoToChallenge()
            }
        } else {
            BetterClick(430, 510)
        }



    } ; Ranger
    } ; Loop
    Sleep 20000
    zestyahh()
}
F3:: {
    Reload()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")  
    ; go to teleporter
    Sleep 100  
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}

PMlogo := "Lib\Images\pulseimg.png"

MainGUI := Gui("+Border +AlwaysOnTop", "BGS Infinity - Impulse")

MainGUI.BackColor := "000000"
MainGUI.SetFont("s9 bold", "Segoe UI")
midX := A_ScreenWidth // 2 - 200  
midY := A_ScreenHeight // 2 - 250  
MainGUI.Show("x" midX " y" midY " w400 h500")

MainGUI.Add("Picture", "x0 y5 w50 h50 +BackgroundTrans", PMlogo)

MainGUI.Add("GroupBox", "x0 y-8 w400 h65")

MainGUI.Add("GroupBox", "x-10 y257 w500 h400")
uiTheme.Push("0xffffff") 

    global MainGui
    global WebhookEnabled, WebhookURLEdit, PingUser, DiscordUserIDEdit
    global SendScreenshot

    global WebhookEnabled := MainGui.AddCheckbox("x10 y343 h20 w135 cffffff" , "Enable Webhook")
    WebhookEnabled.SetFont("s9")
    WebhookURLEdit := MainGui.AddEdit("x150 y343 w220 h20", "Webhook URL here")
    WebhookEnabled.Enabled := true
    global TestWebhookBtn := MainGui.AddButton("x10 y450 w120 h22", "Test Webhook")
    TestWebhookBtn.SetFont("s9")
    TestWebhookBtn.Visible := true

    global SaveSetsConfigBtn := MainGui.AddButton("x10 y420 w100 h22", "Save Settings")
    SaveSetsConfigBtn.SetFont("s9")
    SaveSetsConfigBtn.Visible := true

    PingUser := MainGui.AddCheckbox("x10 y370 cffffff", "Ping User")
    DiscordUserIDEdit := MainGui.AddEdit("x100 y370 w150 h20", "User ID here")

    SendScreenshot := MainGui.AddCheckbox("x10 y397 cffffff w30", "Screenshots")

    WebhookURLEdit.SetFont("s9")
    WebhookURLEdit.Visible := true

    PingUser.SetFont("s9")  
    PingUser.Visible := true

    DiscordUserIDEdit.SetFont("s9")
    DiscordUserIDEdit.Visible := true

    SendScreenshot.SetFont("s9")
    SendScreenshot.Visible := true
; ====== GUI BORDERS GENERAL
UiBorders.Push(MainGUI.AddText("x0 y51 h1000 w1 +Background" uiTheme[1]))
UiBorders.Push(MainGUI.AddText("x399 y51 h1000 w1 +Background" uiTheme[1]))
UiBorders.Push(MainGUI.AddText("x0 y499 h1 w1000 +Background" uiTheme[1]))

; ======
UiBorders.Push(MainGUI.AddText("x0 y90 h1 w1000 +Background" uiTheme[1]))
UiBorders.Push(MainGUI.AddText("x" 160 " y55 h210 w1 +Background" uiTheme[1]))
UiBorders.Push(MainGUI.AddText("x0 y300 h1 w1000 +Background" uiTheme[1]))
MainGUI.SetFont("s20 bold", "Segoe UI")

MainGUI.Add("Text", "x60 y8 w1000 h100 cWhite +BackgroundTrans", "Anime Rangers X ver 1.0")

MainGUI.SetFont("s16 bold", "Segoe UI")

MainGUI.Add("Text", "x18 y56 w1000 h100 cWhite +BackgroundTrans", "Farm Setup")
MainGUI.Add("Text", "x18 y266 w1000 h100 cWhite +BackgroundTrans", "Settings")
MainGUI.Add("Text", "x171 y56 w1000 h100 cWhite +BackgroundTrans", "Process Log")
global TimeStampSwitch:= MainGUI.AddCheckbox("x310 y63 w88 h20 cffffff", "timestamp")
TimeStampSwitch.SetFont("s10")
TimeStampSwitch.Value := true
global CurrentProcessLabel := MainGui.AddText("x164 y96 w380 h22 c0xffffff BackgroundTrans", "► --")
CurrentProcessLabel.SetFont("s10 Bold", "Segoe UI")
global ProcessLogEntries := []
yOffset := 120
Loop 10 {
    entry := MainGui.AddText("x171 y" yOffset " w380 h20 c0xaaaaaa BackgroundTrans", "")
    entry.SetFont("s9", "Segoe UI")
    ProcessLogEntries.Push(entry)
    yOffset += 18
}
MainGUI.SetFont("s12", "Segoe UI")
global ProcessHistory := []
global LastProcessMessage := ""
global AutoChallenge := MainGUI.AddCheckbox("x10 y307 cffffff", "Auto Challenge")
global Retry := MainGUI.AddCheckbox("x160 y307 cffffff", "Retry/Lobby")

AutoChallenge.OnEvent("Click", (*) => ProcessLog("Auto Challenge : " (AutoChallenge.Value ? "ON" : "OFF")))
Retry.OnEvent("Click", (*) => ProcessLog("After Match : " (Retry.Value ? "Retry" : "Lobby")))

FarmSel := MainGUI.Add("DropDownList", "x5 y100 w150", ["Story", "Ranger Stages"])
OptionSel := MainGUI.Add("DropDownList", "x5 y130 w150 Hidden", [""])
ExtraSel := MainGUI.Add("DropDownList", "x5 y160 w150 Hidden", [""])  
RerollSel := MainGUI.Add("DropDownList", "x5 y190 w150 Hidden", [])  

FarmSel.OnEvent("Change", UpdateOptions)
OptionSel.OnEvent("Change", ShowExtraSel)  
ExtraSel.OnEvent("Change", ShowRerollSel)  
FarmSel.OnEvent("Change", OnFarmSelChange)
OptionSel.OnEvent("Change", OnOptionSelChange)
ExtraSel.OnEvent("Change", OnExtraSelChange)
RerollSel.OnEvent("Change", OnRerollSelChange)



UpdateOptions(*) {
    selectedMap := FarmSel.Text
    options := []

    Switch selectedMap {
        Case "Story":
            options := ["Voocha Village", "Green Planet", "Demon Forest", "Leaf Village", "Z City"]
        Case "Ranger Stages":
            options := ["Voocha Village", "Green Planet", "Demon Forest", "Leaf Village", "Z City"]

        Default:
            options := []
    }

    OptionSel.Delete()
    if options.Length > 0 {
        for item in options
            OptionSel.Add([item])
        OptionSel.Visible := true
        OptionSel.Value := 0
    } else {
        OptionSel.Visible := false
    }

    ExtraSel.Visible := false
    RerollSel.Visible := false 
}

ShowExtraSel(*) {
    if (OptionSel.Text != "") {
        enchantHunterOptions := ["Voocha Village", "Green Planet", "Demon Forest", "Leaf Village", "Z City"]
        isEnchantHunter := false

        for item in enchantHunterOptions {
            if (OptionSel.Text == item) {
                isEnchantHunter := true
                break 
            }
        }

        if (isEnchantHunter) {
            ExtraSel.Visible := true
            ExtraSel.Delete()
            if (FarmSel.Text == "Story"){
            ExtraSel.Add(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
            }if (FarmSel.Text == "Ranger Stages"){
                ExtraSel.Add(["1", "2", "3"])
                }
            ExtraSel.Value := 0
        } else {
            ExtraSel.Visible := false
        }
    } else {
        ExtraSel.Visible := false
    }
}

ShowRerollSel(*) {
    if (ExtraSel.Text = "1" or "2" or "3" or "4" or "5" or "6" or "7" or "8" or "9" or "10") and (FarmSel.Text = "Story") {
        RerollSel.Visible := true
        RerollSel.Delete()
        RerollSel.Add(["Normal", "Hard", "Nightmare"])  
        RerollSel.Value := 0  
    } else {
        RerollSel.Visible := false
    }
}

ProcessLog(msg) {
    global CurrentProcessLabel, ProcessLogEntries, ProcessHistory, LastProcessMessage, TimeStampSwitch

    showTime := TimeStampSwitch.Value
    time := FormatTime(A_Now, "HH:mm:ss")
    line := (showTime ? time " - " : "") msg

    if (line = LastProcessMessage)
        return

    if (LastProcessMessage != "") {
        ProcessHistory.InsertAt(1, LastProcessMessage)
        if (ProcessHistory.Length > 8)
            ProcessHistory.Pop()
    }

    LastProcessMessage := line
    CurrentProcessLabel.Text := "► " line

    Loop 8 {
        ProcessLogEntries[A_Index].Text := ProcessHistory.Has(A_Index) ? ProcessHistory[A_Index] : ""
    }
}

OnFarmSelChange(*) {
    UpdateOptions()
    ProcessLog("Changed: " FarmSel.Text)
}
OnOptionSelChange(*) {
    ShowExtraSel()
    ProcessLog("Changed: " OptionSel.Text)
}
OnExtraSelChange(*) {
    ShowRerollSel()
    ProcessLog("Changed: " ExtraSel.Text)
}
OnRerollSelChange(*) {
    ProcessLog("Changed: " RerollSel.Text)
}

v::Reload()
c::ExitApp()


UpdateWebhookUI() {
    global WebhookEnabled, WebhookURLEdit, PingUser, DiscordUserIDEdit
    ; No need to check page anymore

    WebhookURLEdit.Visible := WebhookEnabled.Value
    PingUser.Visible := WebhookEnabled.Value
    DiscordUserIDEdit.Visible := (WebhookEnabled.Value && PingUser.Value)
}

LoadedLoop() {
    ProcessLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 382-150000, 116-150000, 382+150000, 116+150000, 0, 0, VoteStart))
            {
                ProcessLog("Loaded in")
              Sleep 1000
              BetterClick(440, 190) ; click yes
              BetterClick(440, 190) ; click yes
              BetterClick(440, 190) ; click yes
              break
            }
    }
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 382-150000, 116-150000, 382+150000, 116+150000, 0, 0, VoteStart))
            {
                continue
            }
            ProcessLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok:=FindText(&X, &Y, 56-150000, 265-150000, 56+150000, 265+150000, 0, 0, AreasText))
            {
              break
            }
    }
    ProcessLog("Returned to lobby.")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (OptionSel.Text = "Z City"){
        if (ExtraSel.Text = "10"){
            MouseMove(480, 440)
        }
     } else {
    MouseMove(450, 440)
     }
    Sleep 400
    if (ok:=FindText(&X, &Y, 431, 425, 547, 459, 0, 0, LobbyText))
        {
          return true
        }
}

UpgradeUnits(){
    if (ok:=FindText(&X, &Y, 737-150000, 371-150000, 737+150000, 371+150000, 0, 0, UpgUI)){
        SendInput("{t}")
    }
    Sleep 200
    ProcessLog("Beginning unit upgrades.")
    loop{
        loop 3{
        BetterClick(750, 230)
        }
        loop 3{
        BetterClick(750, 315)
            }
        loop 3{
         BetterClick(750, 400)
            }
            if ShouldStopUpgrading() {
                Sleep 200
                if (Retry.Value = true){
                    Sleep 2000
                    ProcessLog("Found retry button.")
                    Sleep 3000
                    return UpgradeUnits()
                }
                if (Retry.Value = false){
                    Sleep 2000
                    ProcessLog("Found return to lobby.")
                    return LobbyLoop()
                }
            }
        }
    }


ShouldStopUpgrading(sleepamount := 100) {
    Sleep sleepamount
    if CheckForLobbyButton() {
        if (Retry.Value = true){
        BetterClick(250, 440)
        }if (Retry.Value = false){
            BetterClick(500, 440)
            }
        return true
   }
}

zestyahh(){
    LoadedLoop()
    StartedLoop()
    Sleep 2000
    UpgradeUnits()
    }

    GoToChallenge(){
    BetterClick(60, 375)
    Sleep 200
    BetterClick(400, 325)
    Sleep 200
    SendInput("d down")
    Sleep 400
    SendInput ("d up")
    BetterClick(350, 300)
    Sleep 200
    BetterClick(430, 510)
    }

    1::CheckForLobbyButton()