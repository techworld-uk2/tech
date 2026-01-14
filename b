Sub SearchApplication()
    Dim fileName As String, appName As String
    Dim key As Variant, outRow As Long

    fileName = Sheets("CONTROL").Range("B2").Value
    appName = Sheets("CONTROL").Range("B3").Value

    Sheets("CONTROL").Rows("8:500").ClearContents
    outRow = 8

    For Each key In AppData.Keys
        If key Like fileName & "|" & appName & "*" Then
            Sheets("CONTROL").Cells(outRow, 1).Resize(1, 40).Value = AppData(key)
            outRow = outRow + 1
        End If
    Next

    If outRow = 8 Then MsgBox "No records found"
End Sub
