param (
    # Name of the Source Tag
    $SourceTag
)

git config --global user.name 'Anilathmacloudeqs'
git config --global user.email 'Anilathma@cloudeqs.com'
git config --global pull.rebase false

git config --list
git branch

Write-Host "Testing the Git tag list"

$tags = git tag
Write-Host "Git tags: $($tags -join ', ')"

Write-Host "Executing git pull on $SourceTag"

git pull origin $SourceTag --allow-unrelated-histories

$commitid = (git log -n 1 --pretty=format:%H) $SourceTag

Write-Host "Commit ID for $SourceTag: $commitid"

echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
