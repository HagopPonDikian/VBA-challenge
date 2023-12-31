Attribute VB_Name = "Module1"
Sub Calculate()
   
    Cells(1, 10).Value = "Ticker"
    Cells(1, 11).Value = "Yearly Change"
    Cells(1, 12).Value = "Percent Change"
    Cells(1, 13).Value = "Total Stock Volume"
    Cells(1, 16).Value = "Ticker"
    Cells(1, 17).Value = "Value"
    Cells(2, 15).Value = "Greatest % increase"
    Cells(3, 15).Value = "Greatest % decrease"
    Cells(4, 15).Value = "Greatest total volume"
    
    Dim lastRow As Long
    lastRow = Cells(Rows.Count, 1).End(xlUp).Row
    
    Dim i As Long
    Dim ticker As String
    Dim TotalVolume As Double
    Dim openPrice As Double
    Dim closePrice As Double
    Dim yearlyChange As Double
    Dim percentChange As Double
    Dim outputRow As Long
    Dim greatestIncrease As Double
    Dim greatestDecrease As Double
    Dim greatestVolume As Double
    
    outputRow = 2
    
    For i = 2 To lastRow
        If Cells(i, 1).Value = ticker Then
            TotalVolume = TotalVolume + Cells(i, 7).Value
        Else
            If ticker <> "" Then
                yearlyChange = closePrice - openPrice

                If openPrice <> 0 Then
                    percentChange = (yearlyChange / openPrice)
                Else
                    percentChange = 0 '
                End If
                Cells(outputRow, 12).NumberFormat = "0.00%"
                Cells(outputRow, 10).Value = ticker
                Cells(outputRow, 11).Value = yearlyChange
                
                Cells(outputRow, 12).Value = percentChange
                Cells(outputRow, 13).Value = TotalVolume
                outputRow = outputRow + 1
                
                If percentChange > greatestIncrease Then
                    greatestIncrease = percentChange
                    greatestIncTicker = ticker
                    Cells(2, 16).Value = greatestIncTicker
                    Cells(2, 17).Value = greatestIncrease
                    Cells(2, 17).NumberFormat = "0.00%"
                ElseIf percentChange < greatestDecrease Then
                    greatestDecrease = percentChange
                    greatestDecTicker = ticker
                    Cells(3, 16).Value = greatestDecTicker
                    Cells(3, 17).Value = greatestDecrease
                    Cells(3, 17).NumberFormat = "0.00%"
                End If
                If TotalVolume > greatestVolume Then
                    greatestVolume = TotalVolume
                    greatestVolTicker = ticker
                    Cells(4, 16).Value = greatestVolTicker
                    Cells(4, 17).Value = greatestVolume
                    
                End If
                
                
            End If
            ticker = Cells(i, 1).Value
            openPrice = Cells(i, 3).Value
            TotalVolume = 0
        End If
        
        closePrice = Cells(i, 6).Value
        
        If i = lastRow Then
            yearlyChange = closePrice - openPrice
   
            If openPrice <> 0 Then
                percentChange = (yearlyChange / openPrice) * 100
            Else
                percentChange = 0
            End If
            Cells(outputRow, 10).Value = ticker
            Cells(outputRow, 11).Value = yearlyChange
            Cells(outputRow, 12).Value = percentChange
            Cells(outputRow, 13).Value = TotalVolume
        End If
        Next i
        
      
    
   
End Sub



