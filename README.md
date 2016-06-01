# Git Merge

A [wercker](http://wercker.com/) step to merge two git branches.

## Options

- `source` The branch to merge (i.e. dev).
- `target` The branch [source] will be merged into (i.e. master).
- `name`   The name you want to appear in your git commit (leave blank for global default)
- `email` The email you want to appear in your git commit (leave blank for global default)

## Example

```yaml
deploy:
  steps:
    - truescape/git-merge:
        source: dev
        target: master
        name: Wercker GitBot
        email: gitbot@example.com
```
