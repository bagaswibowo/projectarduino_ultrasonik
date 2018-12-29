VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8280
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   10965
   LinkTopic       =   "Form1"
   ScaleHeight     =   8280
   ScaleWidth      =   10965
   StartUpPosition =   3  'Windows Default
   Begin MSCommLib.MSComm MSComm1 
      Left            =   960
      Top             =   2640
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   240
      Top             =   3600
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data Source=testingkomdat;Initial Catalog=testing"
      OLEDBString     =   "Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data Source=testingkomdat;Initial Catalog=testing"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "komdat"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Height          =   7335
      Left            =   2880
      TabIndex        =   2
      Top             =   360
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   12938
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   360
      TabIndex        =   1
      Top             =   1440
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Data Yang Di Terima"
      BeginProperty Font 
         Name            =   "Bodoni MT"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Koneksi As New ADODB.Connection
Dim Testing As ADODB.Recordset



Private Sub Form_Load()
MSComm1.CommPort = 6
MSComm1.Settings = "9600,N,8,1"
MSComm1.RThreshold = 3
MSComm1.InputLen = 0
MSComm1.PortOpen = True
End Sub

Private Sub Label4_Click()

End Sub

Private Sub MSComm1_OnComm()
Call BukaDB
Adodc1.ConnectionString = Koneksi
Adodc1.RecordSource = "tbl_sensors_data"
Adodc1.Refresh
Set DataGrid1.DataSource = Adodc1
If (MSComm1.CommEvent = comEvReceive) Then
Label2.Caption = MSComm1.Input
Adodc1.Recordset.AddNew
Adodc1.Recordset!sensors_length_data = Label2.Caption
Adodc1.Recordset.Update
Adodc1.Refresh
End If
End Sub
Sub BukaDB()
Set Koneksi = New ADODB.Connection
Set Testing = New ADODB.Recordset
Koneksi.Open "Provider=MSDASQL.1;Persist Security Info=False;Data Source=testingkomdat"
End Sub

