#=====================================================#
#Name:exerciceDHC2.ps1
#Author: Gazeau Kilian, CUB
#DATE:28/02/2023
#
#Version 1.0
#Comments: Script qui permet de configurer automatiquement une plage d'adresse, pour le DHCP, 
#avec le nom de domaine et l'adresse IP du serveur de domaine tout cela en boîtes de dialogue
#
#
#=====================================================#

#Chargement de la bibliothèque VisualBasic

[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')


# Déclaration de toutes les variable via une intéraction avec l'utitilisateur

$name = [Microsoft.VisualBasic.Interaction]::InputBox("Entrez le nom de votre sous réseau")
$ad_Reseau = [Microsoft.VisualBasic.Interaction]::InputBox("Quelle est l'adresse réseau ? ")
$mask = [Microsoft.VisualBasic.Interaction]::InputBox("Quelle est le masque de vôtre sous réseau ? ")
$1hote = [Microsoft.VisualBasic.Interaction]::InputBox("Quelle est la première adresse à distribuer ?")
$der_hote = [Microsoft.VisualBasic.Interaction]::InputBox("Quelle est la dernière adresse à distribuer ?")
$passerelle = [Microsoft.VisualBasic.Interaction]::InputBox("Quelle est l'adresse de la passerelle ?")

# Affiche toutes les variables afin de faire un récapitulatif

[Microsoft.VisualBasic.Interaction]::MsgBox("Nom de l'étendue : $name `nAdresse de réseau : $ad_Reseau `nMasque: $mask `nPremière adresse : $1hote `nDernière adresse : $der_hote `nPasserelle : $passerelle")


# Demande si la configuration montrer convient 

$Confirm = [Microsoft.VisualBasic.Interaction]::InputBox("Cette configuration vous convient (O/n)")


# Envoie les configurations au service DHCP si les configurations sont bonnes

if(($Confirm -eq "O") -or ($filtre -eq "o"))
{
    Add-DhcpServerv4Scope -Name "$name" -StartRange $1hote -EndRange $der_hote -SubnetMask $mask -Description "nul"
    Set-DhcpServerv4OptionValue -DNSServer 9.9.9.9 -WinsServer 192.168.4.1 -DNSDomain local.dortmund.cub.sioplc.fr -Router $passerelle 
}
Else
{
    Write-Host "Veuillez relancer le script"
    exit
}