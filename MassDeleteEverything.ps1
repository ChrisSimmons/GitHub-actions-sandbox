# Mass delete releases
git tag -l "*" | foreach { gh release delete -y $_ }

# Delete the tags
git fetch
git push -d origin $(git tag -l "*")
git tag -d $(git tag -l "*")

# Delete the runs
gh api /repos/ChrisSimmons/PersonalPublicBuildTesting/actions/runs --paginate `
  | jq -r '.workflow_runs[] | [.id] | @tsv' `
  | foreach { gh api -X delete /repos/ChrisSimmons/PersonalPublicBuildTesting/actions/runs/$_ }
