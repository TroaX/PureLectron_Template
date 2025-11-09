;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PureLectron Template for Webapps an Desktop
; TroaX - 2025
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Declaration
#AppTitle$ = "PureLectron App"
#WindowGadget = 1
#WebviewGadget = 2
#RangeMin = 49152
#RangeMax = 65535
Define.i HTTPPort = Random(#RangeMax,#RangeMin)
Define.i WindowNewX,WindowNewY
IncludeFile "nanohttp.pb" ; ATTENTION: This Server is a Thread!

;;;;; Put your Code Purebasic Code Here ;;;;
;; You can use Spiderbasic or other Code in your app. Use the app.zip for your App ;;

; Windowbilding
Procedure OpenPLWindow(Port.i)
  OpenWindow(#WindowGadget,0,0,800,600,#AppTitle$, #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget | #PB_Window_SizeGadget | #PB_Window_TitleBar | #PB_Window_ScreenCentered)
  WebViewGadget(#WebviewGadget,0,0,800,600,#PB_WebView_Debug)
  SetGadgetText(#WebviewGadget,"http://127.0.0.1:" + Str(Port))
EndProcedure
OpenPLWindow(HTTPPort)

; Endless Loop
Repeat
  Event = WaitWindowEvent()
  If Event = #PB_Event_SizeWindow
    WindowNewX = WindowWidth(#WindowGadget,#PB_Window_InnerCoordinate)
    WindowNewY = WindowHeight(#WindowGadget,#PB_Window_InnerCoordinate)
    ResizeGadget(#WebviewGadget,0,0,WindowNewX,WindowNewY)
  EndIf
Until Event = #PB_Event_CloseWindow
; IDE Options = PureBasic 6.21 (Linux - x64)
; CursorPosition = 16
; Folding = -
; EnableThread
; EnableXP
; EnableWayland
; DPIAware