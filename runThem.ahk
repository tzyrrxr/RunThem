#singleinstance, force
; -- icon --
Menu, Tray, Icon, folder.ico
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2
index := 0
par := []

/*
;--------------------   QTSpim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; title & path
title = QtSpim
path = C:\Program Files (x86)\QtSpim\QtSpim.exe

index += 1
par[index] :=  {title: title , path: path}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*/


#include function\function_quick.ahk
gosub, function
