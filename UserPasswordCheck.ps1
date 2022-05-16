# I used this script to research specific user's password info
# when I started. Checked last pw created, when it was last set, etc.
# Original author unknown, used bits and pieces from various
# StackOverflow threads.

$userid = Read-Host -Prompt "Enter userid: "

$DCs = Get-ADDomainController -Filter * | Select-Object -ExpandProperty name

foreach ($DC in $DCs) {

$user = Get-ADUser $userid -Properties cn, LockedOut, pwdLastSet, `
badPwdCount, badPasswordTime, lastLogon, lastLogoff, lastLogonTimeStamp, `
whenCreated, whenChanged -server $DC

write-host $DC
$user |
    Select-Object cn, `
    @{name='pwdLastSetDT'; `
        expression={[datetime]::fromFileTime($_.pwdlastset)}}, `
    @{name='badPasswordTimeDT'; `
        expression={[datetime]::fromFileTime($_.badPasswordTime)}}, `
    @{name='lastLogonDT'; `
        expression={[datetime]::fromFileTime($_.lastLogon)}}, `
    @{name='lastLogonTimestampDT'; `
        expression={[datetime]::fromFileTime($_.lastLogonTimestamp)}}, `
    whenCreated, `
    whenChanged
}
