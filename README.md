# GitHub actions sandbox

Sandbox for working with GitHub actions

- Make a branch
- Do your testing
- If the result is useful PLACE IT ELSEWHERE
  - This repo is meant to test things and essentially throw them away.

## Helpful things

Mass delete all runs:

``` powershell
gh api /repos/ChrisSimmons/PersonalPublicBuildTesting/actions/runs --paginate `
  | jq -r '.workflow_runs[] | [.id] | @tsv' `
  | foreach { gh api -X delete /repos/ChrisSimmons/PersonalPublicBuildTesting/actions/runs/$_ }
```

- [Mass deletion of GitHub Actions workflow runs](https://qmacro.org/blog/posts/2021/03/26/mass-deletion-of-github-actions-workflow-runs/)
