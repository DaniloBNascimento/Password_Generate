<# 
 Descrição: Programa criado para geração de passwords aleatórios
 Data de criação: 07/07/2020
 Data de última alteração: 07/07/2020
 Autor: Danilo Bastos Nascimento
 E-mail: danilobastos2@gmail.com
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$Form = New-Object system.Windows.Forms.Form
$Form.FormBorderStyle = 'Fixed3D'
$Form.MaximizeBox = $false
$Form.StartPosition = $CenterScreen
$Form.ClientSize = New-Object System.Drawing.Point(300,160)
$Form.text = "Password Generator"
$Form.TopMost = $false

$Label_one = New-Object system.Windows.Forms.Label
$Label_one.text = "Password Generator in PowerShell"
$Label_one.AutoSize = $true
$Label_one.width = 100
$Label_one.height = 100
$Label_one.location = New-Object System.Drawing.Point(25,20)
$Label_one.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Label_one.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#d0021b")

$Password = New-Object system.Windows.Forms.TextBox
$Password.text = ""
$Password.AutoSize = $true
$Password.width = 225
$Password.height = 100
$Password.location = New-Object System.Drawing.Point(35,50)
$Password.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Password.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Green")

$Info_Developer = New-Object system.Windows.Forms.Label
$Info_Developer.text = "Created by Danilo Bastos (Yazaki IT NSS team)"
$Info_Developer.AutoSize = $true
$Info_Developer.height = 100
$Info_Developer.location = New-Object System.Drawing.Point(35,140)
$Info_Developer.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',7)
$Info_Developer.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Black")

$Button1 = New-Object system.Windows.Forms.Button
$Button1.text = "Generate Password"
$Button1.width = 225
$Button1.height = 30
$Button1.location = New-Object System.Drawing.Point(35,100)
$Button1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',8)

$Form.controls.AddRange(@($Label_one,$Password,$Button1,$Info_Developer))

$Button1.Add_Click({ $Password.Text = "Testando!" })

$Form.ShowDialog()