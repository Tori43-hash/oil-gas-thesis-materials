Attribute VB_Name = "NewMacros"
Sub Супер_Печать()
Attribute Супер_Печать.VB_Description = "Макрос записан 14.11.01 1"
Attribute Супер_Печать.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Супер_Печать"
'
' Супер_Печать Макрос
' Макрос записан 14.11.01 1
'
    Application.PrintOut FileName:="", Range:=wdPrintAllDocument, Item:= _
        wdPrintDocumentContent, Copies:=1, Pages:="", PageType:=wdPrintAllPages, _
        Collate:=True, Background:=True, PrintToFile:=False, PrintZoomColumn:=2, _
        PrintZoomRow:=1, PrintZoomPaperWidth:=0, PrintZoomPaperHeight:=0
End Sub
Sub qw()
Attribute qw.VB_Description = "Макрос записан 14.11.01 1"
Attribute qw.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.qw"
'
' qw Макрос
' Макрос записан 14.11.01 1
'
MyResult = MsgBox("Необходимо чтобы число страниц в документе БЫЛО КРАТНЫМ ЧЕТЫРЁМ. Это выполнено?", vbYesNo, "Внимание!")
If MyResult = vbNo Then End

MyPagesCount = InputBox("Число страниц в документе:", "Печать брошюры", 100)
MyPagesCount = Val(MyPagesCount)
MyListsCount = MyPagesCount \ 4
If (MyPagesCount / 4 - MyPagesCount \ 4) <> 0 Then MyListsCount = MyListsCount + 1

MyMessage = "Потребуется листов:" + Str(MyListsCount) + ". Сначала будет произведена печать на одной стороне листов, затем листы нужно перевернуть и будет отпечатана другая сторона. "
MyMessage = MyMessage + "ВНИМАНИЕ !!! Положите в лоток РОВНО необходимое число листов!"
MsgBox MyMessage, , "Информация"


OVER = False

PG1 = MyListsCount * 4
MyPages = ""
For i = 1 To MyListsCount
PG1 = MyListsCount * 4 - (i - 1) * 2
PG2 = 1 + (i - 1) * 2
'Проверка необходимости вывести чистый лист
If PG1 > MyPagesCount Then PG1 = MyPagesCount + 1
'MyMessage = "Страницы " + Str(PG1) + " и " + Str(PG2) + " всего" + Str(MyPagesCount)
'MsgBox MyMessage, , "Печать 1-ой стороны листов"
MyPages = MyPages + Str(PG1) + "," + Str(PG2)
If i < MyListsCount Then MyPages = MyPages + ","
Next
'MsgBox MyPages

Application.PrintOut FileName:="", Range:=wdPrintRangeOfPages, Item:= _
        wdPrintDocumentContent, Copies:=1, Pages:=MyPages, PageType:= _
        wdPrintAllPages, Collate:=True, Background:=True, PrintToFile:=False, _
        PrintZoomColumn:=2, PrintZoomRow:=1, PrintZoomPaperWidth:=0, _
        PrintZoomPaperHeight:=0

'MyResult = MsgBox("Удалите неиспользованные листы из лотка, отпечатанные переверните и положите в лоток. По готовности нажмите <ОК>", , "Внимание !!!")

MyPages = ""
OVER = False

For i = 1 To MyListsCount
PG1 = MyListsCount * 2 - (i - 1) * 2
PG2 = MyListsCount * 2 + 1 + (i - 1) * 2

'Проверка необходимости вывести чистый лист
If PG2 > MyPagesCount Then PG2 = MyPagesCount + 1
'MyMessage = "Страницы " + Str(PG1) + " и " + Str(PG2)
'MsgBox MyMessage, , "Печать 2-ой стороны листов"
MyPages = MyPages + Str(PG1) + "," + Str(PG2)
If i < MyListsCount Then MyPages = MyPages + ","
'Application.PrintOut FileName:="", Range:=wdPrintRangeOfPages, Item:= _
        wdPrintDocumentContent, Copies:=1, Pages:=MyPages, PageType:= _
        wdPrintAllPages, Collate:=True, Background:=True, PrintToFile:=False, _
        PrintZoomColumn:=2, PrintZoomRow:=1, PrintZoomPaperWidth:=0, _
        PrintZoomPaperHeight:=0

Next
'MsgBox MyPages
Application.PrintOut FileName:="", Range:=wdPrintRangeOfPages, Item:= _
        wdPrintDocumentContent, Copies:=1, Pages:=MyPages, PageType:= _
        wdPrintAllPages, Collate:=True, Background:=True, PrintToFile:=False, _
        PrintZoomColumn:=2, PrintZoomRow:=1, PrintZoomPaperWidth:=0, _
        PrintZoomPaperHeight:=0



End Sub
Sub СуперПечать()
Attribute СуперПечать.VB_Description = "Макрос записан 14.11.01 1"
Attribute СуперПечать.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.СуперПечать"
'
' СуперПечать Макрос
' Макрос записан 14.11.01 1
'
    Application.PrintOut FileName:="", Range:=wdPrintRangeOfPages, Item:= _
        wdPrintDocumentContent, Copies:=1, Pages:="1,7", PageType:= _
        wdPrintAllPages, Collate:=True, Background:=True, PrintToFile:=False, _
        PrintZoomColumn:=2, PrintZoomRow:=1, PrintZoomPaperWidth:=0, _
        PrintZoomPaperHeight:=0
End Sub
