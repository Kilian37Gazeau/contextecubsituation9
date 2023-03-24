#=====================================================#
#Name:exerciceDHCP1.ps1
#Author: Gazeau Kilian, CUB
#DATE:28/02/2023
#
#Version 1.0
#Comments: Script qui permet de configurer automatiquement une plage d'adresse, pour le DHCP
#
#
#=====================================================#

# Déclaration de toutes les variable via une intéraction avec l'utitilisateur

$name = Read-Host "Quelle nom voulez-vous donner pour vôtre étendue ? "
$ad_Reseau = Read-Host "Quelle est l'adresse réseau ? "
$mask = Read-Host "Quelle est le masque de vôtre sous réseau ? "
$1hote = Read-Host "Quelle est la première adresse à distribuer ?"
$der_hote = Read-Host "Quelle est la dernière adresse à distribuer ?"
$passerelle = Read-Host "Quelle est l'adresse de la passerelle ?"

# Affiche toutes les variables afin de faire un récapitulatif

write-host "############################################"
Write-Host "Nom de l'étendue : $name"
Write-Host "Adresse de réseau : $ad_Reseau"
Write-Host "Masque: $mask"
Write-Host "Première adresse : $1hote"
Write-Host "Dernière adresse : $der_hote"
Write-Host "Passerelle : $passerelle"

# Demande si la configuration montrer convient 
$Confirm = Read-Host "Cette configuration vous convient (O/n)"

# Envoie les configurations au service DHCP si les configurations sont bonnes
if(($Confirm -eq "O") -or ($filtre -eq "o"))
{
    Add-DhcpServerv4Scope -Name "$name" -StartRange $1hote -EndRange $der_hote -SubnetMask $mask -Description "nul"
    Set-DhcpServerv4OptionValue -DNSServer 9.9.9.9 -Router $passerelle 
}
Else
{
    Write-Host "Veuillez relancer le script"
    exit
}