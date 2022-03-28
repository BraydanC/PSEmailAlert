$emailSmtpServer = "SmtpServer"
$emailSmtpServerPort = "port"
$emailSmtpUser = "email@domain.com"
$password = cat EncryptedPasswordFilePathLocation | convertto-securestring
$emailSmtpPass = $password

$emailFrom = "email@domain.com"
$emailTo = "email@domain.com"

$emailMessage = New-Object System.Net.Mail.MailMessage( $emailFrom , $emailTo )
$emailMessage.Subject = "WEF Audit Failure" 
$emailMessage.Body = "There has been an error in WEF audit log forwarding, review error ID 105"

$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
$SMTPClient.EnableSsl = $True
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
$SMTPClient.Send( $emailMessage )