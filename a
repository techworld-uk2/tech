Dim AppData As Object
Const ROOT_PATH As String = "C:\Users\%USERNAME%\OneDrive\VAPT"

Function GetRootPath() As String
    GetRootPath = Replace(ROOT_PATH, "%USERNAME%", Environ("USERNAME"))
End Function

Sub LoadOneDriveFiles()
    Dim rootPath As String
    rootPath = GetRootPath()

    Set AppData = CreateObject("Scripting.Dictionary")
    Sheets("CONTROL").Range("B2:B1000").ClearContents

    ScanFolder rootPath
    MsgBox "OneDrive files loaded"
End Sub

Sub ScanFolder(folderPath As String)
    Dim fso As Object, folder As Object, subFolder As Object, file As Object
    Dim wb As Workbook, ws As Worksheet
    Dim lastRow As Long, r As Long, key As String

    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.GetFolder(folderPath)

    For Each file In folder.Files
        If file.Name Like "*.xlsx" Or file.Name Like "*.xlsm" Then

            AddFileToDropdown file.Name

            Set wb = Workbooks.Open(file.Path, False, True)
            Set ws = wb.Sheets(1)

            lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row

            For r = 2 To lastRow
                key = file.Name & "|" & ws.Cells(r, 1).Value
                AppData(key) = ws.Rows(r).Value
            Next

            wb.Close False
        End If
    Next

    For Each subFolder In folder.SubFolders
        ScanFolder subFolder.Path
    Next
End Sub

Sub AddFileToDropdown(fileName As String)
    Dim i As Long
    For i = 2 To 1000
        If Sheets("CONTROL").Cells(i, 2).Value = "" Then
            Sheets("CONTROL").Cells(i, 2).Value = fileName
            Exit Sub
        End If
    Next
End Sub
