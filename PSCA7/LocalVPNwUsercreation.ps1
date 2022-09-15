#Create a VPN Server
New-VPNserver -name "MyVPNServer" -ipaddress "192.168.1.1" -location "Local"

#Create user account
new-Aduser -name "John Doe" -accountpassword (Convertto-securestring "Password" -AsPlainText -Force) -enabled $True

#Configure networking settings
Set-VpnConnectionIPsecConfiguration -authenticationmethod "PSK" -encryptionmethod "AES256" -pfsgroup "ECP256" -IKEVersion 2
Set-VPNServerRRASConfiguration -PPTPProtocol "Enabled"

#Enable VPN Server
Enable-VpnServer
