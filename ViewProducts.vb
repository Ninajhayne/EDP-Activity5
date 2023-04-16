Public Class ViewProducts
    Private Sub ViewProducts_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'panel logo background color
        plLogo.BackColor = Color.FromArgb(226, 194, 179)

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

        lbPriceTote.ForeColor = Color.FromArgb(166, 112, 91)
        lbPriceTsuno.ForeColor = Color.FromArgb(166, 112, 91)
        lbPriceCorduroy.ForeColor = Color.FromArgb(166, 112, 91)
        lbPriceSierra.ForeColor = Color.FromArgb(166, 112, 91)
        lbPriceBucket.ForeColor = Color.FromArgb(166, 112, 91)

        'side-nav
        'button customer list
        btnAdmin.Cursor = Cursors.Hand
        btnAdmin.FlatAppearance.BorderSize = 0
        btnAdmin.FlatStyle = FlatStyle.Flat

        btnCustomers.Cursor = Cursors.Hand
        btnCustomers.FlatAppearance.BorderSize = 0
        btnCustomers.FlatStyle = FlatStyle.Flat

        PictureBox2.BackColor = Color.FromArgb(166, 112, 91)
        btnProducts.FlatStyle = FlatStyle.Flat
        btnProducts.FlatAppearance.BorderSize = 0
        btnProducts.BackColor = Color.FromArgb(166, 112, 91)
        btnProducts.ForeColor = Color.White
        btnProducts.Cursor = Cursors.Hand

        btnOrders.Cursor = Cursors.Hand
        btnOrders.FlatAppearance.BorderSize = 0
        btnOrders.FlatStyle = FlatStyle.Flat

        btnTransaction.Cursor = Cursors.Hand
        btnTransaction.FlatAppearance.BorderSize = 0
        btnTransaction.FlatStyle = FlatStyle.Flat

        btnSales.Cursor = Cursors.Hand
        btnSales.FlatAppearance.BorderSize = 0
        btnSales.FlatStyle = FlatStyle.Flat

        'round border for Tote panel
        plTote.BackColor = Color.White
        plTote.ForeColor = Color.Black

        Dim tote As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectTote As Rectangle = plTote.ClientRectangle
        tote.AddArc(rectTote.X, rectTote.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        tote.AddArc(rectTote.X + rectTote.Width - cornerRadius * 2, rectTote.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        tote.AddArc(rectTote.X + rectTote.Width - cornerRadius * 2, rectTote.Y + rectTote.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        tote.AddArc(rectTote.X, rectTote.Y + rectTote.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        tote.CloseAllFigures()

        plTote.Region = New Region(tote)

        'round border for Tsuno panel
        plTsuno.BackColor = Color.White
        plTsuno.ForeColor = Color.Black

        Dim tsuno As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectTsuno As Rectangle = plTsuno.ClientRectangle
        tsuno.AddArc(rectTsuno.X, rectTsuno.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        tsuno.AddArc(rectTsuno.X + rectTsuno.Width - cornerRadius * 2, rectTsuno.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        tsuno.AddArc(rectTsuno.X + rectTsuno.Width - cornerRadius * 2, rectTsuno.Y + rectTsuno.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        tsuno.AddArc(rectTsuno.X, rectTsuno.Y + rectTsuno.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        tsuno.CloseAllFigures()

        plTsuno.Region = New Region(tsuno)

        'round border for Corduroy panel
        plCorduroy.BackColor = Color.White
        plCorduroy.ForeColor = Color.Black

        Dim Corduroy As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectCorduroy As Rectangle = plCorduroy.ClientRectangle
        Corduroy.AddArc(rectCorduroy.X, rectCorduroy.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Corduroy.AddArc(rectCorduroy.X + rectCorduroy.Width - cornerRadius * 2, rectCorduroy.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Corduroy.AddArc(rectCorduroy.X + rectCorduroy.Width - cornerRadius * 2, rectCorduroy.Y + rectCorduroy.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Corduroy.AddArc(rectCorduroy.X, rectCorduroy.Y + rectCorduroy.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Corduroy.CloseAllFigures()

        plCorduroy.Region = New Region(Corduroy)

        'round border for Sierra panel
        plSierra.BackColor = Color.White
        plSierra.ForeColor = Color.Black

        Dim Sierra As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectSierra As Rectangle = plSierra.ClientRectangle
        Sierra.AddArc(rectSierra.X, rectSierra.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Sierra.AddArc(rectSierra.X + rectSierra.Width - cornerRadius * 2, rectSierra.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Sierra.AddArc(rectSierra.X + rectSierra.Width - cornerRadius * 2, rectSierra.Y + rectSierra.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Sierra.AddArc(rectSierra.X, rectSierra.Y + rectSierra.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Sierra.CloseAllFigures()

        plSierra.Region = New Region(Sierra)

        'round border for Bucket panel
        plBucket.BackColor = Color.White
        plBucket.ForeColor = Color.Black

        Dim Bucket As Drawing2D.GraphicsPath = New Drawing2D.GraphicsPath()
        Dim rectBucket As Rectangle = plBucket.ClientRectangle
        Bucket.AddArc(rectBucket.X, rectBucket.Y, cornerRadius * 2, cornerRadius * 2, 180, 90)
        Bucket.AddArc(rectBucket.X + rectBucket.Width - cornerRadius * 2, rectBucket.Y, cornerRadius * 2, cornerRadius * 2, 270, 90)
        Bucket.AddArc(rectBucket.X + rectBucket.Width - cornerRadius * 2, rectBucket.Y + rectBucket.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 0, 90)
        Bucket.AddArc(rectBucket.X, rectBucket.Y + rectBucket.Height - cornerRadius * 2, cornerRadius * 2, cornerRadius * 2, 90, 90)
        Bucket.CloseAllFigures()

        plBucket.Region = New Region(Bucket)
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
End Class