<# 
 Descrição: Programa criado para geração de passwords aleatórios
 Data de criação: 07/07/2020
 Data de última alteração: 08/07/2020
 Autor: Danilo Bastos Nascimento
 E-mail: danilobastos2@gmail.com
 Padrões utilizados:
 * A senhas serão geradas com a seguintes características:
 - Senhas fracas, exemplo: Mfgt@2020
 - Senhas Fortes, exemplo: FtUghr$5000
 - Senhas Muito Fortes, exemplo: UGthjLRT#4890
#>

# Log de carregamento
Write-Host "Aguarde o carregamento..."
cls

# Listas para as consultas randomicas
$Alphabet_letters = "A", "B", "C", "D", "E", "F", "G", "H", `
			"I", "J", "K", "L", "M", "N", "O", "P", `
			"Q", "R", "S", "T", "U", "V", "W", "X", `
			"Y", "Z"

$Special_letters = "!", "@", "#", "$", "%", "&", "*"

# Funções para cada tipo de senha
# -------------------------------
# Senha Fraca:
function Easy_Pass {

	$letter1 = Get-Random $Alphabet_letters
	$letter2 = Get-Random $Alphabet_letters.ToLower()
	$letter3 = Get-Random $Alphabet_letters.ToLower()
	$letter4 = Get-Random $Alphabet_letters.ToLower()
	$Special = Get-Random $Special_letters
	$Number_generate = Get-Random -Minimum 1000 -Maximum 9999
	$Passwd = $letter1+$letter2+$letter3+$letter4+$Special+$Number_generate
	$Password.Text = $Passwd
	$Passwd | clip
}

# Função para uncheck box
function No_SelectBox_one {
	
	if ($CheckBox1.Checked -eq $true) { 
		$CheckBox2.Checked = $false
		$CheckBox3.Checked = $false	
	}  

}

function No_SelectBox_two {

	if ($CheckBox2.Checked -eq $true) {  
		$CheckBox1.Checked = $false
		$CheckBox3.Checked = $false	
	}
}

function No_SelectBox_tree {
	if ($CheckBox3.Checked -eq $true) {
		$CheckBox1.Checked = $false
		$CheckBox2.Checked = $false
	}
}

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
$Label_one.location = New-Object System.Drawing.Point(6,10)
$Label_one.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',13.8)
$Label_one.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("DarkBlue")

# label onde é forncecido o password no form principal
$Password = New-Object system.Windows.Forms.TextBox
$Password.text = ""
$Password.AutoSize = $true
$Password.width = 225
$Password.height = 100
$Password.location = New-Object System.Drawing.Point(35,45)
$Password.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Password.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("Red")

# Botão de checagem para senha fraca
$CheckBox1 = New-Object system.Windows.Forms.CheckBox
$CheckBox1.text = "Senha Fraca"
$CheckBox1.AutoSize = $false
$CheckBox1.width = 90
$CheckBox1.height = 20
$CheckBox1.location = New-Object System.Drawing.Point(5,80)
$CheckBox1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',7.4)
$CheckBox1.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#f6a1a1")
$CheckBox1.Checked = $true

# Botão de checagem para senha forte
$CheckBox2 = New-Object system.Windows.Forms.CheckBox
$CheckBox2.text = "Senha Forte"
$CheckBox2.AutoSize = $false
$CheckBox2.width = 90
$CheckBox2.height = 20
$CheckBox2.location = New-Object System.Drawing.Point(99,80)
$CheckBox2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',7.4)
$CheckBox2.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffef0a")
$CheckBox2.Checked = $false

# Botão de checagem para senha muito forte
$CheckBox3 = New-Object system.Windows.Forms.CheckBox
$CheckBox3.text = "Senha Muito forte"
$CheckBox3.AutoSize = $false
$CheckBox3.width = 105
$CheckBox3.height = 20
$CheckBox3.location = New-Object System.Drawing.Point(194,80)
$CheckBox3.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',7.4)
$CheckBox3.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#5cff70")
$CheckBox3.Checked = $false

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
$Button1.location = New-Object System.Drawing.Point(35,105)
$Button1.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',8)

# Instanciando itens 
$Form.controls.AddRange(@($Label_one,$Password,$CheckBox1,$CheckBox2,$CheckBox3,$Button1,$Info_Developer))

# Eventos dos checksbox
$CheckBox1.add_Click({ No_Selectbox_one })
$CheckBox2.add_Click({ No_Selectbox_two })
$CheckBox3.add_Click({ No_Selectbox_tree })

# Evento clique, obs.: Será trabalhando a lógica de geração de senhas
$Button1.Add_Click({ Easy_Pass })

# main loop
$Form.ShowDialog()