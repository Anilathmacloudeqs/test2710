<#
 Description: PowerShell Script to get commit id for a specific tag and set it to a pipeline variable
 Author: tres
#>

param (
    # Name of the Source Tag
    $SourceTag
)

# Set Git global configurations
git config --global user.name 'tres'
git config --global user.email 'tres@gmail.com'
git config --global pull.rebase false

# List current Git configurations and branches
git config --list
git branch

# Display a message
Write-Host "Testing the Git tag list"

# List Git tags
$tags = git tag
Write-Host "Git tags: $($tags -join ', ')"

# Display a message
Write-Host "Executing git pull on $SourceTag"

# Perform a Git pull operation on the specified source tag
git pull origin $SourceTag --allow-unrelated-histories

# Get the commit ID for the specified source tag
$commitid = (git log -n 1 --pretty=format:%H) $SourceTag

# Display the obtained commit ID
Write-Host "Commit ID for $SourceTag: $commitid"

# Set the commit ID as a pipeline variable
echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
