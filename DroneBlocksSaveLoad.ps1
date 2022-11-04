﻿###################### CREATING PS GUI TOOL #############################
 
    #### Form settings #################################################################
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
 
    $Form = New-Object System.Windows.Forms.Form
    $Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
    $Form.Text = "DroneBlocksFileSaving"   
    $Form.Size = New-Object System.Drawing.Size(1010,400)  
    $Form.StartPosition = "CenterScreen" #loads the window in the center of the screen
    $Form.BackgroundImageLayout = "Zoom"
    $Form.MinimizeBox = $False
    $Form.MaximizeBox = $False
    $Form.WindowState = "Normal"
    $Form.SizeGripStyle = "Hide"
    $Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
    $Form.Icon = $Icon
 
    #### Title - Powershell GUI Tool ###################################################
    $Label = New-Object System.Windows.Forms.Label
    $LabelFont = New-Object System.Drawing.Font("Calibri",18,[System.Drawing.FontStyle]::Bold)
    $Label.Font = $LabelFont
    $Label.Text = "DroneBlocks File Saving"
    $Label.AutoSize = $True
    $Label.Location = New-Object System.Drawing.Size(370,40) 
    $Form.Controls.Add($Label)
 
    #### Input window with "Server name" label ##########################################
    <#
    $InputBox = New-Object System.Windows.Forms.TextBox 
    $InputBox.Location = New-Object System.Drawing.Size(10,50) 
    $InputBox.Size = New-Object System.Drawing.Size(180,20) 
    $Form.Controls.Add($InputBox)
    $Label2 = New-Object System.Windows.Forms.Label
    $Label2.Text = "Server name:"
    $Label2.AutoSize = $True
    $Label2.Location = New-Object System.Drawing.Size(15,30) 
    $Form.Controls.Add($Label2)
    #>
 
###################### BUTTONS ##########################################################
 
    #### Group boxes for buttons ########################################################
    $groupBox = New-Object System.Windows.Forms.GroupBox
    $groupBox.Location = New-Object System.Drawing.Size(10,10) 
    $groupBox.size = New-Object System.Drawing.Size(180,320)
    $groupBox.text = "Tools"
    $Form.Controls.Add($groupBox) 
 
    #### OS Info Button #################################################################
    $OSInfo = New-Object System.Windows.Forms.Button
    $OSInfo.Location = New-Object System.Drawing.Size(15,30)
    $OSInfo.Size = New-Object System.Drawing.Size(150,60)
    $OSInfo.Text = "Install"
    $OSInfo.Add_Click({OSInfo})
    $OSInfo.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($OSInfo)
 
    #### Certificates ###################################################################
    $Certificate = New-Object System.Windows.Forms.Button
    $Certificate.Location = New-Object System.Drawing.Size(15,110)
    $Certificate.Size = New-Object System.Drawing.Size(150,60)
    $Certificate.Text = "Load"
    $Certificate.Add_Click({Certificates})
    $Certificate.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($Certificate)
 
    #### AD Information #################################################################
    $ADInfo = New-Object System.Windows.Forms.Button
    $ADInfo.Location = New-Object System.Drawing.Size(15,190)
    $ADInfo.Size = New-Object System.Drawing.Size(150,60)
    $ADInfo.Text = "AD Info"
    $ADInfo.Add_Click({ADInfo})
    $ADInfo.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($ADInfo)
 
###################### END BUTTONS ######################################################
 
    #### Output Box Field ###############################################################
    $outputBox = New-Object System.Windows.Forms.RichTextBox
    $outputBox.Location = New-Object System.Drawing.Size(200,100) 
    $outputBox.Size = New-Object System.Drawing.Size(780,265)
    $outputBox.Font = New-Object System.Drawing.Font("Consolas", 8 ,[System.Drawing.FontStyle]::Regular)
    $outputBox.MultiLine = $True
    $outputBox.ScrollBars = "Vertical"
    $outputBox.Text = " `
          Welcome to your first Powershell GUI Tool - Type Domain Controller name and press one of the available buttons."
    $Form.Controls.Add($outputBox)
 
    ##############################################
 
    $Form.Add_Shown({$Form.Activate()})
    [void] $Form.ShowDialog()