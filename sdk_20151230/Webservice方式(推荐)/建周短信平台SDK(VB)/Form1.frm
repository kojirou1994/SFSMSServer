VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "建周短信平台"
   ClientHeight    =   5670
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   7785
   LinkTopic       =   "Form1"
   ScaleHeight     =   5670
   ScaleWidth      =   7785
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command8 
      Caption         =   "Command8"
      Height          =   495
      Left            =   4080
      TabIndex        =   33
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Command7"
      Height          =   495
      Left            =   240
      TabIndex        =   32
      Top             =   4920
      Width           =   1215
   End
   Begin VB.TextBox TextProxyPasswd 
      Height          =   285
      Left            =   6480
      TabIndex        =   30
      Top             =   600
      Width           =   975
   End
   Begin VB.TextBox TextProxyUserid 
      Height          =   285
      Left            =   4440
      TabIndex        =   29
      Top             =   600
      Width           =   1215
   End
   Begin VB.TextBox TextProxyPort 
      Height          =   285
      Left            =   6960
      TabIndex        =   28
      Text            =   "808"
      Top             =   240
      Width           =   495
   End
   Begin VB.TextBox TextProxyHost 
      Height          =   285
      Left            =   4440
      TabIndex        =   27
      Top             =   240
      Width           =   1815
   End
   Begin VB.TextBox TextTimer3 
      Height          =   285
      Left            =   5640
      TabIndex        =   23
      Text            =   "200712201200"
      Top             =   5040
      Width           =   1575
   End
   Begin VB.TextBox TextTimer2 
      Height          =   285
      Left            =   5640
      TabIndex        =   22
      Text            =   "200712101200"
      Top             =   4680
      Width           =   1575
   End
   Begin VB.TextBox TextTimer1 
      Height          =   285
      Left            =   2040
      TabIndex        =   20
      Text            =   "200712101200"
      Top             =   5280
      Width           =   1575
   End
   Begin VB.TextBox TextReceipt 
      Height          =   285
      Left            =   5640
      TabIndex        =   18
      Top             =   3600
      Width           =   1575
   End
   Begin VB.TextBox TextContent 
      Height          =   855
      Left            =   1440
      TabIndex        =   16
      Top             =   2160
      Width           =   6015
   End
   Begin VB.TextBox TextMobile 
      Height          =   525
      IMEMode         =   3  'DISABLE
      Left            =   1440
      TabIndex        =   12
      Top             =   1560
      Width           =   4455
   End
   Begin VB.TextBox TextURL 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1440
      TabIndex        =   11
      Text            =   "http://www.jianzhou.sh.cn:8080/JianzhouSMSWSServer/services/BusinessService"
      Top             =   1080
      Width           =   6015
   End
   Begin VB.CommandButton Command6 
      Caption         =   "验证用户"
      Height          =   495
      Left            =   240
      TabIndex        =   9
      Top             =   3360
      Width           =   1215
   End
   Begin VB.TextBox TextPass 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1080
      PasswordChar    =   "#"
      TabIndex        =   7
      Top             =   600
      Width           =   2295
   End
   Begin VB.TextBox TextUser 
      Height          =   285
      Left            =   1080
      TabIndex        =   5
      Top             =   240
      Width           =   2295
   End
   Begin VB.CommandButton Command5 
      Caption         =   "查看定时状态"
      Height          =   495
      Left            =   4080
      TabIndex        =   4
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "定时发送"
      Height          =   495
      Left            =   2040
      TabIndex        =   3
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "群发"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "查看回执"
      Height          =   495
      Left            =   4080
      TabIndex        =   1
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "单发"
      Height          =   495
      Left            =   2040
      TabIndex        =   0
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "端号"
      Height          =   195
      Left            =   6480
      TabIndex        =   31
      Top             =   240
      Width           =   360
   End
   Begin VB.Label Label10 
      Caption         =   "代理服务器"
      Height          =   255
      Left            =   3480
      TabIndex        =   24
      Top             =   240
      Width           =   975
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "代理密码"
      Height          =   195
      Left            =   5760
      TabIndex        =   26
      Top             =   600
      Width           =   720
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "代理用户名"
      Height          =   195
      Left            =   3480
      TabIndex        =   25
      Top             =   600
      Width           =   900
   End
   Begin VB.Label Label9 
      Caption         =   "起止时间"
      Height          =   255
      Left            =   5640
      TabIndex        =   21
      Top             =   4440
      Width           =   1215
   End
   Begin VB.Label Label8 
      Caption         =   "定时时间"
      Height          =   255
      Left            =   2040
      TabIndex        =   19
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "回执号"
      Height          =   255
      Left            =   5640
      TabIndex        =   17
      Top             =   3360
      Width           =   615
   End
   Begin VB.Label Label6 
      Caption         =   "短信内容"
      Height          =   255
      Left            =   360
      TabIndex        =   15
      Top             =   2280
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "多个号码用;隔开"
      Height          =   255
      Left            =   6000
      TabIndex        =   14
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "目标号码"
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   1560
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "服务器地址"
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "密码"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   600
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "用户名"
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    nRet = sendMessage(TextUser.Text, TextPass.Text, TextMobile.Text, TextContent.Text)
    
    MsgBox CStr(nRet)
End Sub

Private Sub Command2_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    Dim ret As String * 1024
    
    nRet = getReceipt(TextUser.Text, TextPass.Text, TextReceipt.Text, ret)
    MsgBox "返回值：" + CStr(nRet) + " 内容为：" + ret
End Sub

Private Sub Command3_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    nRet = sendBatchMessage(TextUser.Text, TextPass.Text, TextMobile.Text, TextContent.Text)
    MsgBox CStr(nRet)
End Sub

Private Sub Command4_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    nRet = sendTimelyMessage(TextUser.Text, TextPass.Text, TextTimer1.Text, TextMobile.Text, TextContent.Text)
    
    MsgBox CStr(nRet)
    MsgBox CStr(ret)
End Sub

Private Sub Command5_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    Dim ret As String * 4096
    nRet = getTimelySendStatus(TextUser.Text, TextPass.Text, TextTimer2.Text, TextTimer3.Text, ret)
    MsgBox CStr(nRet)
    MsgBox CStr(ret)
End Sub

Private Sub Command6_Click()
    releaseAll
    nRet = setWebService(TextURL.Text)
    If TextProxyHost.Text <> "" Then
    nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
    End If
    
    nRet = validateUser(TextUser.Text, TextPass.Text)
    MsgBox CStr(nRet)

End Sub

Private Sub Command7_Click()
Dim i As Integer
nRet = setWebService(TextURL.Text)
If TextProxyHost.Text <> "" Then
nRet = setProxy(TextProxyHost.Text, CInt(TextProxyPort.Text), TextProxyUserid.Text, TextProxyPasswd.Text)
End If

Dim ret As String * 4096
nRet = getUserInfo(TextUser.Text, TextPass.Text)
MsgBox nRet
End Sub

'调用实例： unico 转中文显示
'MsgBox strUcodeToCh("\u4f31\u7ba1\u6211\u5436\u4e48\u591a")
Private Function strUcodeToCh(strUCode$) As String
    Dim v, i&, l&, strResult$
    strUCode = Mid(strUCode, 2)
    v = Split(strUCode, "\")
    For i = 0 To UBound(v)
        l = CLng("&H" & Mid(v(i), 2, 2)) * 256 + CLng("&H" & Mid(v(i), 4))
        strResult = strResult & ChrW(l)
    Next
    strUcodeToCh = strResult
End Function
