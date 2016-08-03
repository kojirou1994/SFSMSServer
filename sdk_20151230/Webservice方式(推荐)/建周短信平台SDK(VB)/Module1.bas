Attribute VB_Name = "NOSMS"
Option Explicit

Public Declare Function setWebService Lib "JZSms.dll" (ByVal endpoint As String) As Long
Public Declare Function setProxy Lib "JZSms.dll" (ByVal IP As String, ByVal Port As Long, ByVal UserName As String, ByVal Password As String) As Long
Public Declare Function releaseAll Lib "JZSms.dll" () As Long
Public Declare Function sendMessage Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal destmobile As String, ByVal msgText As String) As Long
Public Declare Function getReceipt Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal TaskID As String, ByRef result As String) As Long
Public Declare Function sendBatchMessage Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal destmobile As String, ByVal msgText As String) As Long
Public Declare Function sendTimelyMessage Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal sendDateTime As String, ByVal destmobile As String, ByVal msgText As String) As Long
Public Declare Function modifyPassword Lib "JZSms.dll" (ByVal UserName As String, ByVal OldPassword As String, ByVal NewPassword As String) As Long
Public Declare Function validateUser Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String) As Long
Public Declare Function getUserInfo Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByRef result As String) As Long
Public Declare Function getReceivedMsg Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal param As Integer, ByRef result As String) As Long
Public Declare Function getTimelySendStatus Lib "JZSms.dll" (ByVal UserName As String, ByVal Password As String, ByVal datetime_from As String, ByVal datetime_to As String, ByRef result As String) As Long
