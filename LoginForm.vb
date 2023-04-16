Imports MySql.Data.MySqlClient

Public Class LoginForm

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        With Me
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Dim myreader As MySqlDataReader


            strSQL = "Select * from users where username = '" _
                & .tbUsername.Text & "' and password = sha2('" _
                & .tbPassword.Text & "', 224)"
            'MsgBox(strSQL)
            mycmd.CommandText = strSQL
            mycmd.Connection = myconn

            myreader = mycmd.ExecuteReader
            If myreader.HasRows Then
                .Hide()
                Home.Show()
            Else
                MessageBox.Show("Invalid username or password")
            End If
            Call Disconnect_to_DB()
        End With
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

    Private Sub LoginForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Label1.ForeColor = Color.FromArgb(166, 112, 91)


        ' tbUsername.BackColor = Color.FromArgb(226, 194, 179)
        ' tbPassword.BackColor = Color.FromArgb(226, 194, 179)

        btnLogin.FlatStyle = FlatStyle.Flat
        btnLogin.FlatAppearance.BorderSize = 0
        btnLogin.BackColor = Color.FromArgb(166, 112, 91)
        btnLogin.ForeColor = Color.White
        btnLogin.Cursor = Cursors.Hand
        roundbutton(btnLogin)

        btnCancel.Cursor = Cursors.Hand
        roundbutton(btnCancel)

        'round border for Username panel
        Dim Username As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim cornerRadius As Integer = 10
        Dim rectUsername As Rectangle = plUsername.ClientRectangle
        Username.AddArc(rectUsername.X, rectUsername.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Username.AddArc(rectUsername.X + rectUsername.Width - cornerRadius * 2, rectUsername.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Username.AddArc(rectUsername.X + rectUsername.Width - cornerRadius * 2, rectUsername.Y + rectUsername.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Username.AddArc(rectUsername.X, rectUsername.Y + rectUsername.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Username.CloseAllFigures()

        plUsername.Region = New Region(Username)

        'round border for Password panel
        Dim Password As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectPassword As Rectangle = plPassword.ClientRectangle
        Password.AddArc(rectPassword.X, rectPassword.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Password.AddArc(rectPassword.X + rectPassword.Width - cornerRadius * 2, rectPassword.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Password.AddArc(rectPassword.X + rectPassword.Width - cornerRadius * 2, rectPassword.Y + rectPassword.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Password.AddArc(rectPassword.X, rectPassword.Y + rectPassword.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Password.CloseAllFigures()

        plPassword.Region = New Region(Password)
    End Sub

    Private Sub roundbutton(btn As Button)
        Dim radius As Integer = 10 ' Set the radius of the rounded corner
        Dim login As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        login.StartFigure()
        login.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        login.AddLine(radius, 0, btnLogin.Width - radius, 0)
        login.AddArc(New Rectangle(btnLogin.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        login.AddLine(btnLogin.Width, radius, btnLogin.Width, btnLogin.Height - radius)
        login.AddArc(New Rectangle(btnLogin.Width - radius * 2, btnLogin.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        login.AddLine(btnLogin.Width - radius, btnLogin.Height, radius, btnLogin.Height)
        login.AddArc(New Rectangle(0, btnLogin.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        login.CloseFigure()
        btnLogin.Region = New Region(login)

        Dim cancel As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        cancel.StartFigure()
        cancel.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        cancel.AddLine(radius, 0, btnCancel.Width - radius, 0)
        cancel.AddArc(New Rectangle(btnCancel.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        cancel.AddLine(btnCancel.Width, radius, btnCancel.Width, btnCancel.Height - radius)
        cancel.AddArc(New Rectangle(btnCancel.Width - radius * 2, btnCancel.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        cancel.AddLine(btnCancel.Width - radius, btnCancel.Height, radius, btnCancel.Height)
        cancel.AddArc(New Rectangle(0, btnCancel.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        cancel.CloseFigure()
        btnCancel.Region = New Region(cancel)
    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles Label1.Click

    End Sub
End Class


