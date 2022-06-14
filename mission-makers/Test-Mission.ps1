$missionpath = Read-Host "Path to your Mission Folder"
if($false -eq (test-path $missionpath)){Write-Warning "Invalid Mission Path";Break}
# $missionpath = "/home/justin/Downloads/examplemission"
write-host "Missionpath is $missionpath" -ForegroundColor Cyan
# $missionpath = "/home/justin/Downloads/Spetsnaz_920_Gundam.UMB_Colombia"
try {
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern "disabledAI=1;" -ErrorAction stop)) { Write-Warning "Could not find AI Disabled Setting of disabledAI=1" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern "respawn=3;" -ErrorAction stop)) { Write-Warning "Could not find Respawn on Custom Position value of respawn=3" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern "respawnDelay=5;" -ErrorAction stop)) { Write-Warning "Could not find Respawn Delay value of respawnDelay=5" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern "HC_1" -ErrorAction stop)) { Write-Warning "Could not find headless client name of HC_1" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern "HeadlessClient_F" -ErrorAction stop)) { Write-Warning "Could not find a headless client module" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern 'value="CUP_B_Pchela1T_CDF,B_UAV_06_F,B_UAV_06_medical_F,B_UAV_01_F,B_UAV_05_F,B_UGV_01_F,B_UGV_01_rcws_F,B_UAV_02_dynamicLoadout_F,B_T_UAV_03_dynamicLoadout_F,B_T_UGV_01_olive_F,B_T_UGV_01_rcws_olive_F,CUP_B_AH6X_USA,CUP_B_USMC_DYN_MQ9,CUP_B_Seafox_USV_USMC,O_UAV_01_F,CUP_O_Pchela1T_RU,O_UAV_06_medical_F,O_UAV_01_F,O_UGV_01_F,O_UGV_01_rcws_F,O_UAV_02_dynamicLoadout_F,O_T_UAV_04_CAS_F,O_T_UGV_01_ghex_F,O_T_UGV_01_rcws_ghex_F,I_UAV_06_F,I_UAV_06_medical_F,I_UAV_01_F,I_UGV_01_F,I_UGV_01_rcws_F,I_UAV_02_dynamicLoadout_F,C_UAV_06_F,C_UAV_06_medical_F,C_IDAP_UAV_06_antimine_F,C_IDAP_UAV_01_F,C_IDAP_UGV_01_F,C_IDAP_UAV_06_F,C_IDAP_UAV_06_medical_F,I_E_UAV_06_F,I_E_UAV_06_medical_f,I_E_UAV_01_F,I_E_UGV_02_Demining_F,I_E_UGV_02_Science_F,I_E_UGV_01_F,I_E_UGV_01_rcws_F";' -ErrorAction stop)) { Write-Warning "Headless Client Ignore List is Incorrect" }
    if ($null -eq (Select-String -Path $missionpath/mission.sqm -Pattern 'type="ModuleRespawnPosition_F";' -ErrorAction stop)) { Write-Warning "Could not find a Respawn Module" }
}
catch { Write-Warning "Could not find mission.sqm" }
    
try {
    if ((Get-FileHash $missionpath/initplayerlocal.sqf -ErrorAction stop).hash -ne "F621297716FC9DE0FF9F11D297DC08F5B67A42AA6C578DB1EEF7762CC4258B1E") { Write-Warning "File Hash of initplayerlocal is incorrect" }
}
catch { Write-Warning "Could not find initplayerlocal" }

try {
    if ((Get-FileHash $missionpath/initserver.sqf -ErrorAction stop).hash -ne "79534E2E0ABFE9B361EBC55859BBFEE32B68F7BC1FFBAF350DF69D5A1F2B43C8") { Write-Warning "File Hash of initserver is incorrect" }
}
catch { Write-Warning "Could not find initserver" }

try { 
    if ((Get-FileHash $missionpath/init.sqf -ErrorAction stop).hash -ne "18FCA33CA7ADD6AE754975CB64235874F5D97EAC464421C6CE94C6D12FADDD0D") { Write-Warning "File Hash of init is incorrect" }
}
catch { Write-Warning "Could not find init.sqf" }

try {
    if ((Get-FileHash $missionpath/onPlayerKilled.sqf -ErrorAction stop).hash -ne "0040D5FCD4BB9EBDEA5FB3D65F1F73E4978401FAC93003632C8A013CACB77F1F") { Write-Warning "File Hash of onPlayerKilled is incorrect" }
}
catch { Write-Warning "Could not find onPlayerKilled" }

try { 
    if ((Get-FileHash $missionpath/onPlayerRespawn.sqf -ErrorAction stop).hash -ne "DAB4DC555556A3BFB9A91A15A0497A3130C9A60F76B28FD366EA0E089D925209") { Write-Warning "File Hash of onPlayerRespawn is incorrect" }
}
catch { "Could not find onPlayerRespawn" }

try {
    if ($null -eq (test-path $missionpath/taw_vd -ErrorAction stop)) {

        $taw_vd_files = Get-ChildItem $missionpath/taw_vd -recurse

        if ($taw_vd_files.name.count -eq "12") {}
        
        $array = @("CfgFunctions.hpp", "defines.h", "fn_onChar.sqf", "fn_onSavePressed.sqf", "fn_onSaveSelectionChanged.sqf", "fn_onSliderChanged.sqf", "fn_onTerrainChanged.sqf", "fn_openMenu.sqf", "fn_openSaveManager.sqf", "fn_stateTracker.fsm", "fn_updateViewDistance.sqf", "GUI.h")
        
        if ($null -eq (Compare-Object $taw_vd_files.name $array -ErrorAction stop)) { Write-Warning "taw_vd folder has too few or too many files" }
        
        if ((Get-FileHash $missionpath/taw_vd/CfgFunctions.hpp -ErrorAction stop).hash -ne "52F31C556E43E5D87750A5021CD739A3FE82F88E389CCC5A6DD1C4CB461FE716") { Write-Warning "File Hash of taw_vd/CfgFunctions.hpp is incorrect" }
        
        
        if ((Get-FileHash $missionpath/taw_vd/defines.h -ErrorAction stop).hash -ne "4D62C5A9C92B2D87B8163B9018F31E8B99F748E4CD466FD10BDCAFECB8163B75") { Write-Warning "File Hash of taw_vd/defines.h is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_onChar.sqf -ErrorAction stop).hash -ne "57C826F6BCBD9813C497F1C5091B8BECA7101DA041EAAEEE577259A96BDEAF54") { Write-Warning "File Hash of taw_vd/fn_onChar.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_onSavePressed.sqf -ErrorAction stop).hash -ne "7354E2C66A78EC74D9C8FB2C98EB0295AE15B6385658C924D1115F5FF49C008E") { Write-Warning "File Hash of taw_vd/fn_onSavePressed.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_onSaveSelectionChanged.sqf -ErrorAction stop).hash -ne "891D2C71AFA936D28FBD2A7F5DEABE8CCCDF38CECE0E3EECEE11C8EA73052970") { Write-Warning "File Hash of taw_vd/fn_onSaveSelectionChanged.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_onSliderChanged.sqf -ErrorAction stop).hash -ne "2CF59A381C2EA0E4DB629EF18979E08FC1CF0EC82CC0D8EE15980EE62A9F49F9") { Write-Warning "File Hash of taw_vd/fn_onSliderChanged.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_onTerrainChanged.sqf -ErrorAction stop).hash -ne "4DF5FC9E85CD39E6F04D1E2CA684A00791E2AC996D0D88094C9136096D02BE38") { Write-Warning "File Hash of taw_vd/fn_onTerrainChanged.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_openMenu.sqf -ErrorAction stop).hash -ne "E859F2BD6C5A49B787BB05489B0839B95D275214C1B49A48D29DDA456536B94D") { Write-Warning "File Hash of taw_vd/fn_openMenu.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_openSaveManager.sqf -ErrorAction stop).hash -ne "860FCC63C239BBA519F45032FAAD2636B5E34ED4C892BBB7D32968EBB42B698A") { Write-Warning "File Hash of taw_vd/fn_openSaveManager.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_stateTracker.fsm -ErrorAction stop).hash -ne "220D3CC56CCFDCA17145F997911F56B0497CCE4F236686DDF93848B16C4688F6") { Write-Warning "File Hash of taw_vd/fn_stateTracker.fsm is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/fn_updateViewDistance.sqf -ErrorAction stop).hash -ne "D0F9C692C81B45DCD46D32623F204BFC61B0E784300D6892E3C8FFF3F7AB7391") { Write-Warning "File Hash of taw_vd/fn_updateViewDistance.sqf is incorrect" }
        
        if ((Get-FileHash $missionpath/taw_vd/GUI.h -ErrorAction stop).hash -ne "BF79EA5AE3F63078B58B6CEDC6AAEB7566B29D93F1033F540385BD09C10E000F") { Write-Warning "File Hash of taw_vd/GUI.h is incorrect" }
    }
}
catch { Write-Warning  "Could not find taw_vd" }

