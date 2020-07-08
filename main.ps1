<# 
 Descrição: Programa criado para geração de passwords aleatórios
 Data de criação: 07/07/2020
 Data de última alteração: 07/07/2020
 Autor: Danilo Bastos Nascimento
 E-mail: danilobastos2@gmail.com
 Padrões utilizados:
 * A senhas serão geradas com a seguintes características:
 - Senhas fracas, exemplo: Mfgt@2020
 - Senhas Fortes, exemplo: FtUghr$5000
 - Senhas Muito Fortes, exemplo: UGthjLRT#4890
#>

# Listas para as consultas randomicas
$Alphabet_letters = "A", "B", "C", "D", "E", "F", "G", "H", `
			"I", "J", "K", "L", "M", "N", "O", "P", `
			"Q", "R", "S", "T", "U", "V", "W", "X", `
			"Y", "Z"

$Special_letters = "!", "@", "#", "$", "%", "&", "*"

# Gerando número randomicamente
$Number_generate = Get-Random -Minimum 1000 -Maximum 9999

# Funções para cada tipo de senha
# -------------------------------
# Senha Fraca:
function Easy_Pass {

	$letter1 = Get-Random $Alphabet_letters
	$letter2 = Get-Random $Alphabet_letters.ToLower()
	$letter3 = Get-Random $Alphabet_letters.ToLower()
	$letter4 = Get-Random $Alphabet_letters.ToLower()
	$Special = Get-Random $Special_letters
	$Number = $Number_generate
	$Passwd = $letter1+$letter2+$letter3+$letter4+$Special+$Number
	$Password.Text = $Passwd
	$Passwd | clip
}

# Log de carregamento
Write-Host "Aguarde o carregamento..."
cls

# Adicionando módulo para construção dos forms
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Form principal
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$Form = New-Object system.Windows.Forms.Form
$Form.FormBorderStyle = 'Fixed3D'
$Form.MaximizeBox = $false
$Form.StartPosition = $CenterScreen
$Form.ClientSize = New-Object System.Drawing.Point(300,160)
$Form.text = "Password Generator"
$Form.TopMost = $false

# label informativa do programa
$Label_one = New-Object system.Windows.Forms.Label
$Label_one.text = "Password Generator in PowerShell"
$Label_one.AutoSize = $true
$Label_one.width = 100
$Label_one.height = 100
$Label_one.location = New-Object System.Drawing.Point(25,20)
$Label_one.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Label_one.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Green")

# label onde é forncecido o password no form principal
$Password = New-Object system.Windows.Forms.TextBox
$Password.text = ""
$Password.AutoSize = $true
$Password.width = 225
$Password.height = 100
$Password.location = New-Object System.Drawing.Point(35,50)
$Password.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Password.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Red")

# label de informação sobre o developer
$Info_Developer = New-Object system.Windows.Forms.Label
$Info_Developer.text = "Created by Danilo Bastos (Yazaki IT NSS team)"
$Info_Developer.AutoSize = $true
$Info_Developer.height = 100
$Info_Developer.location = New-Object System.Drawing.Point(48,140)
$Info_Developer.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',7)
$Info_Developer.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Gray")

# Butão para gerar senhas
$Button1 = New-Object system.Windows.Forms.Button
$Button1.text = "Generate Password"
$Button1.width = 225
$Button1.height = 30
$Button1.location = New-Object System.Drawing.Point(35,100)
$Button1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',8)

# Instanciando itens 
$Form.controls.AddRange(@($Label_one,$Password,$Button1,$Info_Developer))

# Evento clique, obs.: Será trabalhando a lógica de geração de senhas
$Button1.Add_Click({ Easy_Pass })

# main loop
$Form.ShowDialog()