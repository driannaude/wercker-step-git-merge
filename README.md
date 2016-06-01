# Git Merge

A [wercker](http://wercker.com/) step to merge two git branches.

## Options

- `source` The branch to merge (i.e. dev).
- `target` The branch [source] will be merged into (i.e. master).

## Example

```yaml
deploy:
  steps:
    - truescape/git-merge:
        source: dev
        target: master
```
