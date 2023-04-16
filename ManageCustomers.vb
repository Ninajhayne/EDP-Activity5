Imports System.Diagnostics.Eventing
Imports MySql.Data.MySqlClient
Public Class ManageCustomers
    Private Sub ManageCustomers_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'panel logo background color
        plLogo.BackColor = Color.FromArgb(226, 194, 179)

        'round border for Main panel
        Dim Main As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim cornerRadius As Integer = 10
        Dim rectMain As Rectangle = plMain.ClientRectangle
        Main.AddArc(rectMain.X, rectMain.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Main.AddArc(rectMain.X + rectMain.Width - cornerRadius * 2, rectMain.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Main.AddArc(rectMain.X + rectMain.Width - cornerRadius * 2, rectMain.Y + rectMain.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Main.AddArc(rectMain.X, rectMain.Y + rectMain.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Main.CloseAllFigures()

        plMain.Region = New Region(Main)

        'round border for Search panel
        Dim Search As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectSearch As Rectangle = plSearch.ClientRectangle
        Search.AddArc(rectSearch.X, rectSearch.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Search.AddArc(rectSearch.X + rectSearch.Width - cornerRadius * 2, rectSearch.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Search.AddArc(rectSearch.X + rectSearch.Width - cornerRadius * 2, rectSearch.Y + rectSearch.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Search.AddArc(rectSearch.X, rectSearch.Y + rectSearch.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Search.CloseAllFigures()

        plSearch.Region = New Region(Search)

        'button Add customer
        btnAdd.FlatStyle = FlatStyle.Flat
        btnAdd.FlatAppearance.BorderSize = 0
        btnAdd.BackColor = Color.FromArgb(166, 112, 91)
        btnAdd.Cursor = Cursors.Hand
        roundbutton(btnAdd)

        'button Update customer
        btnUpdate.FlatStyle = FlatStyle.Flat
        btnUpdate.FlatAppearance.BorderSize = 0
        btnUpdate.BackColor = Color.FromArgb(226, 194, 179)
        btnUpdate.Cursor = Cursors.Hand
        roundbutton(btnUpdate)

        'button Delete customer
        btnDelete.FlatStyle = FlatStyle.Flat
        btnDelete.FlatAppearance.BorderSize = 0
        btnDelete.BackColor = Color.FromArgb(226, 194, 179)
        btnDelete.Cursor = Cursors.Hand
        roundbutton(btnDelete)

        'button Search
        btnSearch.FlatStyle = FlatStyle.Flat
        btnSearch.FlatAppearance.BorderSize = 0
        btnSearch.BackColor = Color.FromArgb(226, 194, 179)
        btnSearch.Cursor = Cursors.Hand
        roundbutton(btnSearch)

        'side-nav
        'button manage customer 
        btnAdmin.Cursor = Cursors.Hand
        btnAdmin.FlatAppearance.BorderSize = 0
        btnAdmin.FlatStyle = FlatStyle.Flat

        btnCustomers.Cursor = Cursors.Hand
        btnCustomers.FlatAppearance.BorderSize = 0
        btnCustomers.FlatStyle = FlatStyle.Flat

        btnCustomerList.Cursor = Cursors.Hand
        btnCustomerList.FlatAppearance.BorderSize = 0
        btnCustomerList.FlatStyle = FlatStyle.Flat

        PictureBox6.BackColor = Color.FromArgb(166, 112, 91)
        btnManageCustomers.FlatStyle = FlatStyle.Flat
        btnManageCustomers.FlatAppearance.BorderSize = 0
        btnManageCustomers.BackColor = Color.FromArgb(166, 112, 91)
        btnManageCustomers.ForeColor = Color.White
        btnManageCustomers.Cursor = Cursors.Hand

        btnProducts.Cursor = Cursors.Hand
        btnProducts.FlatAppearance.BorderSize = 0
        btnProducts.FlatStyle = FlatStyle.Flat

        btnOrders.Cursor = Cursors.Hand
        btnOrders.FlatAppearance.BorderSize = 0
        btnOrders.FlatStyle = FlatStyle.Flat

        btnTransaction.Cursor = Cursors.Hand
        btnTransaction.FlatAppearance.BorderSize = 0
        btnTransaction.FlatStyle = FlatStyle.Flat

        btnSales.Cursor = Cursors.Hand
        btnSales.FlatAppearance.BorderSize = 0
        btnSales.FlatStyle = FlatStyle.Flat
    End Sub

    Private Sub roundbutton(btn As Button)
        Dim radius As Integer = 10 ' Set the radius of the rounded corner
        Dim add As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        add.StartFigure()
        add.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        add.AddLine(radius, 0, btnAdd.Width - radius, 0)
        add.AddArc(New Rectangle(btnAdd.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        add.AddLine(btnAdd.Width, radius, btnAdd.Width, btnAdd.Height - radius)
        add.AddArc(New Rectangle(btnAdd.Width - radius * 2, btnAdd.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        add.AddLine(btnAdd.Width - radius, btnAdd.Height, radius, btnAdd.Height)
        add.AddArc(New Rectangle(0, btnAdd.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        add.CloseFigure()
        btnAdd.Region = New Region(add)

        Dim update As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        update.StartFigure()
        update.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        update.AddLine(radius, 0, btnUpdate.Width - radius, 0)
        update.AddArc(New Rectangle(btnUpdate.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        update.AddLine(btnUpdate.Width, radius, btnUpdate.Width, btnUpdate.Height - radius)
        update.AddArc(New Rectangle(btnUpdate.Width - radius * 2, btnUpdate.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        update.AddLine(btnUpdate.Width - radius, btnUpdate.Height, radius, btnUpdate.Height)
        update.AddArc(New Rectangle(0, btnUpdate.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        update.CloseFigure()
        btnUpdate.Region = New Region(update)

        Dim delete As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        delete.StartFigure()
        delete.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        delete.AddLine(radius, 0, btnDelete.Width - radius, 0)
        delete.AddArc(New Rectangle(btnDelete.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        delete.AddLine(btnDelete.Width, radius, btnDelete.Width, btnDelete.Height - radius)
        delete.AddArc(New Rectangle(btnDelete.Width - radius * 2, btnDelete.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        delete.AddLine(btnDelete.Width - radius, btnDelete.Height, radius, btnDelete.Height)
        delete.AddArc(New Rectangle(0, btnDelete.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        delete.CloseFigure()
        btnDelete.Region = New Region(delete)

        Dim search As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        search.StartFigure()
        search.AddLine(radius, 0, btnSearch.Width - radius, 0)
        search.AddArc(New Rectangle(btnSearch.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        search.AddLine(btnSearch.Width, radius, btnSearch.Width, btnSearch.Height - radius)
        search.AddArc(New Rectangle(btnSearch.Width - radius * 2, btnSearch.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        search.AddLine(btnSearch.Width - radius, btnSearch.Height, radius, btnSearch.Height)
        search.CloseFigure()
        btnSearch.Region = New Region(search)
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        With Me
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Try
                strSQL = "Insert into customers values('" _
                    & .tbID.Text & "', '" _
                    & .tbName.Text & "','" _
                    & .tbContact.Text & "', '" _
                    & .tbAddress.Text & "', '" _
                    & .tbCity.Text & "','" _
                    & .tbPostal.Text & "')"
                mycmd.CommandText = strSQL
                mycmd.Connection = myconn
                mycmd.ExecuteNonQuery()
                MsgBox("Record Successfully Added")
                Call Clear_Boxes()
            Catch ex As MySqlException
                MsgBox(ex.Number & " " & ex.Message)
            End Try
            Disconnect_to_DB()
        End With
    End Sub

    Private Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        With Me
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Try
                strSQL = "Update customers set Customer_name = '" _
                & .tbName.Text & "', Contact_num = '" _
                & .tbContact.Text & "', address = '" _
                & .tbAddress.Text & "', city = '" _
                & .tbCity.Text & "', postal_code = '" _
                & .tbPostal.Text & "' where Customer_id = '" _
                & .tbID.Text & "'"

                mycmd.CommandText = strSQL
                mycmd.Connection = myconn
                mycmd.ExecuteNonQuery()
                MsgBox("Record Successfully Updated")
                Call Clear_Boxes()
            Catch ex As MySqlException
                MsgBox(ex.Number & " " & ex.Message)
            End Try
            Disconnect_to_DB()
        End With
    End Sub
    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        With Me
            Call Connect_to_DB()
            Dim mycmd As New MySqlCommand
            Try
                Dim answer As MsgBoxResult
                answer = MsgBox("Are you sure you want to delete this record?", MsgBoxStyle.YesNo)
                If answer = MsgBoxResult.Yes Then
                    strSQL = "Delete from customers" _
                                    & " where customer_ID = '" _
                                    & .tbID.Text & "'"

                    'MsgBox(strSQL)
                    mycmd.CommandText = strSQL
                    mycmd.Connection = myconn
                    mycmd.ExecuteNonQuery()
                    MsgBox("Record Successfully Deleted")
                    Call Clear_Boxes()
                End If

            Catch ex As MySqlException
                MsgBox(ex.Number & " " & ex.Message)
            End Try
            Disconnect_to_DB()
        End With
    End Sub

    Private Sub Clear_Boxes()
        With Me
            .tbID.Text = vbNullString
            .tbName.Text = ""
            .tbContact.Text = ""
            .tbAddress.Text = ""
            .tbCity.Text = ""
            .tbPostal.Text = ""
        End With

    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Call Connect_to_DB()
        With Me
            Dim mycmd As New MySqlCommand
            Dim myreader As MySqlDataReader


            strSQL = "Select Customer_id, Customer_name, contact_num, address, city, postal_code from customers where Customer_id = '" _
                    & .tbSearch.Text & "'"
            'MsgBox(strSQL)
            mycmd.CommandText = strSQL
            mycmd.Connection = myconn
            myreader = mycmd.ExecuteReader
            If myreader.HasRows Then
                While myreader.Read()
                    .tbID.Text = myreader.GetString(0)
                    .tbName.Text = myreader.GetString(1)
                    .tbContact.Text = myreader.GetString(2)
                    .tbAddress.Text = myreader.GetString(3)
                    .tbCity.Text = myreader.GetString(4)
                    .tbPostal.Text = myreader.GetString(5)

                End While
            Else
                MsgBox("Customer Number ID not exists!")
            End If
            Call Disconnect_to_DB()

        End With
    End Sub
    Private Sub btnCustomerList_Click(sender As Object, e As EventArgs) Handles btnCustomerList.Click
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

    Private Sub btnTransaction_Click(sender As Object, e As EventArgs) Handles btnTransaction.Click
        With Me
            .Hide()
            ViewTransaction.Show()
        End With
    End Sub
End Class