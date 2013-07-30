# Git Merge

A [wercker](http://wercker.com/) step to merge two git branches.

## Options

- `source` The branch to merge.
- `target` The branch which will get the merged content.

## Example

```yaml
deploy:
  steps:
    - simonmenke/git-merge:
        source: devel
        target: master
```
