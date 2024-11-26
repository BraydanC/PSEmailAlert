$Rooms = @(
"Room1@name.com",
"Room2@name.com",
"Room3@name.com",
"Room4@name.com",
"Room5@name.com"
)

$DistributionGroup = "Corp Rooms"

foreach ($Room in $Rooms) {
    try {
        Add-DistributionGroupMember -Identity $DistributionGroup -Member $Room -ErrorAction Stop
        Write-Host "Added $Room to $DistributionGroup successfully."
    } catch {
        Write-Host "Failed to add $Room to $DistributionGroup $_" 
    }
}