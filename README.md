# Ref SHA

`ref-sha` is a GitHub Action that provides an output `sha` with shortened commit SHA by ref.

## Usage

You can access the shortened value with `${{ steps.get-sha.outputs.sha }}` (PS: `get-sha` in this example is the id of the step)

```yaml
name: 'Get Latest Commit shortened by Ref'
on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: matheusraz/ref-sha@v1
        id: get-sha
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          ref: my_branch
      - run: echo $SHA
        env:
          SHA: ${{ steps.get-sha.outputs.sha }}
```

## Options

| Name          | Required | Default | Description                              |
| ------------- | -------- | ------- | ---------------------------------------- |
| ref           | `true`   | null       | Ref name to get latest commit shortened (possible to be branch name or tag) |
| length        | `false`  | 7   | length of shortened sha    |