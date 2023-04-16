Public Class Home
    Private Sub Home_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'label title color
        Label1.ForeColor = Color.White

        'panel title background color
        plTitle.BackColor = Color.FromArgb(166, 112, 91)

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

        'round border for Main panel
        Dim Main As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectMain As Rectangle = plMain.ClientRectangle
        Main.AddArc(rectMain.X, rectMain.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Main.AddArc(rectMain.X + rectMain.Width - cornerRadius * 2, rectMain.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Main.AddArc(rectMain.X + rectMain.Width - cornerRadius * 2, rectMain.Y + rectMain.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Main.AddArc(rectMain.X, rectMain.Y + rectMain.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Main.CloseAllFigures()

        plMain.Region = New Region(Main)

        btnProducts.FlatStyle = FlatStyle.Flat
        btnProducts.FlatAppearance.BorderSize = 0
        btnProducts.BackColor = Color.White
        btnProducts.ForeColor = Color.Black
        btnProducts.Cursor = Cursors.Hand
        roundbutton(btnProducts)

        btnCustomers.FlatStyle = FlatStyle.Flat
        btnCustomers.FlatAppearance.BorderSize = 0
        btnCustomers.BackColor = Color.White
        btnCustomers.ForeColor = Color.Black
        btnCustomers.Cursor = Cursors.Hand
        roundbutton(btnCustomers)

        btnOrders.FlatStyle = FlatStyle.Flat
        btnOrders.FlatAppearance.BorderSize = 0
        btnOrders.BackColor = Color.White
        btnOrders.ForeColor = Color.Black
        btnOrders.Cursor = Cursors.Hand
        roundbutton(btnOrders)

        btnTransaction.FlatStyle = FlatStyle.Flat
        btnTransaction.FlatAppearance.BorderSize = 0
        btnTransaction.BackColor = Color.White
        btnTransaction.ForeColor = Color.Black
        btnTransaction.Cursor = Cursors.Hand
        roundbutton(btnTransaction)

        btnSales.FlatStyle = FlatStyle.Flat
        btnSales.FlatAppearance.BorderSize = 0
        btnSales.BackColor = Color.White
        btnSales.ForeColor = Color.Black
        btnSales.Cursor = Cursors.Hand
        roundbutton(btnSales)

        'button backup 
        btnBackup.FlatStyle = FlatStyle.Flat
        btnBackup.FlatAppearance.BorderSize = 0
        btnBackup.BackColor = Color.FromArgb(226, 194, 179)
        btnBackup.Cursor = Cursors.Hand
        roundbutton(btnBackup)

        'button locate 
        btnLocate.FlatStyle = FlatStyle.Flat
        btnLocate.FlatAppearance.BorderSize = 0
        btnLocate.BackColor = Color.FromArgb(226, 194, 179)
        btnLocate.Cursor = Cursors.Hand
        roundbutton(btnLocate)
    End Sub

    Private Sub roundbutton(btn As Button)
        Dim radius As Integer = 10 ' Set the radius of the rounded corner

        Dim products As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        products.StartFigure()
        products.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        products.AddLine(radius, 0, btnProducts.Width - radius, 0)
        products.AddArc(New Rectangle(btnProducts.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        products.AddLine(btnProducts.Width, radius, btnProducts.Width, btnProducts.Height - radius)
        products.AddArc(New Rectangle(btnProducts.Width - radius * 2, btnProducts.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        products.AddLine(btnProducts.Width - radius, btnProducts.Height, radius, btnProducts.Height)
        products.AddArc(New Rectangle(0, btnProducts.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        products.CloseFigure()
        btnProducts.Region = New Region(products)

        Dim customers As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        customers.StartFigure()
        customers.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        customers.AddLine(radius, 0, btnCustomers.Width - radius, 0)
        customers.AddArc(New Rectangle(btnCustomers.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        customers.AddLine(btnCustomers.Width, radius, btnCustomers.Width, btnCustomers.Height - radius)
        customers.AddArc(New Rectangle(btnCustomers.Width - radius * 2, btnCustomers.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        customers.AddLine(btnCustomers.Width - radius, btnCustomers.Height, radius, btnCustomers.Height)
        customers.AddArc(New Rectangle(0, btnCustomers.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        customers.CloseFigure()
        btnCustomers.Region = New Region(customers)

        Dim orders As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        orders.StartFigure()
        orders.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        orders.AddLine(radius, 0, btnOrders.Width - radius, 0)
        orders.AddArc(New Rectangle(btnOrders.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        orders.AddLine(btnOrders.Width, radius, btnOrders.Width, btnOrders.Height - radius)
        orders.AddArc(New Rectangle(btnOrders.Width - radius * 2, btnOrders.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        orders.AddLine(btnOrders.Width - radius, btnOrders.Height, radius, btnOrders.Height)
        orders.AddArc(New Rectangle(0, btnOrders.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        orders.CloseFigure()
        btnOrders.Region = New Region(orders)

        Dim sales As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        sales.StartFigure()
        sales.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        sales.AddLine(radius, 0, btnTransaction.Width - radius, 0)
        sales.AddArc(New Rectangle(btnTransaction.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        orders.AddLine(btnTransaction.Width, radius, btnTransaction.Width, btnTransaction.Height - radius)
        sales.AddArc(New Rectangle(btnTransaction.Width - radius * 2, btnTransaction.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        sales.AddLine(btnTransaction.Width - radius, btnTransaction.Height, radius, btnTransaction.Height)
        sales.AddArc(New Rectangle(0, btnTransaction.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        sales.CloseFigure()
        btnTransaction.Region = New Region(sales)

        Dim backup As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        backup.StartFigure()
        backup.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        backup.AddLine(radius, 0, btnBackup.Width - radius, 0)
        backup.AddArc(New Rectangle(btnBackup.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        backup.AddLine(btnBackup.Width, radius, btnBackup.Width, btnBackup.Height - radius)
        backup.AddArc(New Rectangle(btnBackup.Width - radius * 2, btnBackup.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        backup.AddLine(btnBackup.Width - radius, btnBackup.Height, radius, btnBackup.Height)
        backup.AddArc(New Rectangle(0, btnBackup.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        backup.CloseFigure()
        btnBackup.Region = New Region(backup)

        Dim locate As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        locate.StartFigure()
        locate.AddArc(New Rectangle(0, 0, radius * 2, radius * 2), 180, 90)
        locate.AddLine(radius, 0, btnLocate.Width - radius, 0)
        locate.AddArc(New Rectangle(btnLocate.Width - radius * 2, 0, radius * 2, radius * 2), -90, 90)
        locate.AddLine(btnLocate.Width, radius, btnLocate.Width, btnLocate.Height - radius)
        locate.AddArc(New Rectangle(btnLocate.Width - radius * 2, btnLocate.Height - radius * 2, radius * 2, radius * 2), 0, 90)
        locate.AddLine(btnLocate.Width - radius, btnLocate.Height, radius, btnLocate.Height)
        locate.AddArc(New Rectangle(0, btnLocate.Height - radius * 2, radius * 2, radius * 2), 90, 90)
        locate.CloseFigure()
        btnLocate.Region = New Region(locate)
    End Sub

    Private Sub btnProducts_Click(sender As Object, e As EventArgs) Handles btnProducts.Click
        With Me
            .Hide()
            ViewProducts.Show()
        End With
    End Sub

    Private Sub btnCustomers_Click(sender As Object, e As EventArgs) Handles btnCustomers.Click
        With Me
            .Hide()
            ViewCustomers.Show()
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

    Private Sub btnBackup_Click(sender As Object, e As EventArgs) Handles btnBackup.Click
        Dim RetVal
        RetVal = Shell("C:\Users\PRINCESS\Desktop\backupfunction.bat", 1)
    End Sub

    Private Sub btnLocate_Click(sender As Object, e As EventArgs) Handles btnLocate.Click
        With Me
            .FolderBrowserDialog.ShowDialog()
        End With
    End Sub
End Class