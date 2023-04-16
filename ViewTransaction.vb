Imports System.Diagnostics.Eventing
Imports MySql.Data.MySqlClient
Public Class ViewTransaction
    Private Sub ViewTransaction_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        With Me
            load_table()
            'panel logo background color
            plLogo.BackColor = Color.FromArgb(226, 194, 179)

            'label title color
            Label1.ForeColor = Color.White

            'panel title background color
            plTitle.BackColor = Color.FromArgb(166, 112, 91)

            'button load grid view
            btnLoad.FlatStyle = FlatStyle.Flat
            btnLoad.FlatAppearance.BorderSize = 0
            btnLoad.BackColor = Color.FromArgb(226, 194, 179)
            btnLoad.Cursor = Cursors.Hand
            roundbutton(btnLoad)

            'side-nav
            'button customer list

            btnAdmin.Cursor = Cursors.Hand
            btnAdmin.FlatAppearance.BorderSize = 0
            btnAdmin.FlatStyle = FlatStyle.Flat

            btnCustomers.Cursor = Cursors.Hand
            btnCustomers.FlatAppearance.BorderSize = 0
            btnCustomers.FlatStyle = FlatStyle.Flat

            btnProducts.Cursor = Cursors.Hand
            btnProducts.FlatAppearance.BorderSize = 0
            btnProducts.FlatStyle = FlatStyle.Flat

            btnOrders.Cursor = Cursors.Hand
            btnOrders.FlatAppearance.BorderSize = 0
            btnOrders.FlatStyle = FlatStyle.Flat

            PictureBox4.BackColor = Color.FromArgb(166, 112, 91)
            btnTransaction.FlatStyle = FlatStyle.Flat
            btnTransaction.FlatAppearance.BorderSize = 0
            btnTransaction.BackColor = Color.FromArgb(166, 112, 91)
            btnTransaction.ForeColor = Color.White
            btnTransaction.Cursor = Cursors.Hand

            btnSales.Cursor = Cursors.Hand
            btnSales.FlatAppearance.BorderSize = 0
            btnSales.FlatStyle = FlatStyle.Flat

            'round border for Title panel
            Dim Title As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
            Dim cornerRadius As Integer = 10
            Dim rectTitle As Rectangle = plTitle.ClientRectangle
            Title.AddArc(rectTitle.X, rectTitle.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
            Title.AddArc(rectTitle.X + rectTitle.Width - cornerRadius * 2, rectTitle.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
            Title.AddArc(rectTitle.X + rectTitle.Width - cornerRadius * 2, rectTitle.Y + rectTitle.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
            Title.AddArc(rectTitle.X, rectTitle.Y + rectTitle.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
            Title.CloseAllFigures()

            plTitle.Region = New Region(Title)
        End With
    End Sub
    Private Sub load_table()
        With Me
            myconn = New MySqlConnection
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Dim mysda As New MySqlDataAdapter
            Dim dtable As New DataTable
            Dim bdSource As New BindingSource
            Try
                Dim strsQL As String
                strsQL = "select * FROM ordering_system.transaction_report"
                mycmd = New MySqlCommand(strsQL, myconn)
                mysda.SelectCommand = mycmd
                mysda.Fill(dtable)
                bdSource.DataSource = dtable
                DataGridView1.DataSource = bdSource
                mysda.Update(dtable)
            Catch ex As MySqlException
                MsgBox(ex.Number & " " & ex.Message)
            End Try
            Disconnect_to_DB()
        End With
    End Sub
    Private Sub btnLoad_Click(sender As Object, e As EventArgs) Handles btnLoad.Click
        With Me
            myconn = New MySqlConnection
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Dim mysda As New MySqlDataAdapter
            Dim dtable As New DataTable
            Dim bdSource As New BindingSource
            Try
                Dim strsQL As String
                strsQL = "select * FROM ordering_system.transaction_report"
                mycmd = New MySqlCommand(strsQL, myconn)
                mysda.SelectCommand = mycmd
                mysda.Fill(dtable)
                bdSource.DataSource = dtable
                DataGridView1.DataSource = bdSource
                mysda.Update(dtable)

                MsgBox("Record Successfully Loaded")
            Catch ex As MySqlException
                MsgBox(ex.Number & " " & ex.Message)
            End Try
            Disconnect_to_DB()
        End With
    End Sub

    Private Sub roundbutton(btn As Button)
        Dim radius As Integer = 10 ' Set the radius of the rounded corner

        Dim load As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        load.StartFigure()
        load.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        load.AddLine(radius, 0, btnLoad.Width - radius, 0)
        load.AddArc(New Rectangle(btnLoad.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        load.AddLine(btnLoad.Width, radius, btnLoad.Width, btnLoad.Height - radius)
        load.AddArc(New Rectangle(btnLoad.Width - radius * 2, btnLoad.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        load.AddLine(btnLoad.Width - radius, btnLoad.Height, radius, btnLoad.Height)
        load.AddArc(New Rectangle(0, btnLoad.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        load.CloseFigure()
        btnLoad.Region = New Region(load)
    End Sub

    Private Sub btnCustomers_Click(sender As Object, e As EventArgs) Handles btnCustomers.Click
        With Me
            .Hide()
            ViewCustomers.Show()
        End With
    End Sub

    Private Sub btnProducts_Click(sender As Object, e As EventArgs) Handles btnProducts.Click
        With Me
            .Hide()
            ViewProducts.Show()
        End With
    End Sub

    Private Sub btnOrders_Click(sender As Object, e As EventArgs) Handles btnOrders.Click
        With Me
            .Hide()
            ViewOrders.Show()
        End With
    End Sub

    Private Sub btnSales_Click(sender As Object, e As EventArgs) Handles btnSales.Click
        With Me
            .Hide()
            ViewSales.Show()
        End With
    End Sub
End Class