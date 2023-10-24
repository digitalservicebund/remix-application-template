# Remix Application Template

⚠️ **Be warned:** This template is currently work in progress and has not been tested in production yet.

Bootstrap a [Remix](https://remix.run/docs) and TypeScript application with Continuous Delivery

### Git Hooks

For the provided Git hooks you will need to install [lefthook](https://github.com/evilmartians/lefthook/blob/master/docs/full_guide.md)
(git hook manager) and [talisman](https://thoughtworks.github.io/talisman/docs) (secrets scanner):

```bash
brew install lefthook talisman
./run.sh init
```

The following hooks are specified in the `lefthook.yml`:

- `commitlint` - write [conventional commit messages](https://chris.beams.io/posts/git-commit/)
- `lint` - avoid committing code violating linting rules
- `format` - avoid committing wrongly formatted code

Before pushing, the following checks are additionally ran:

- `licenses-audit` - uses `license-checker` to verify depency licenses
- `secrets-audit` - avoid accidental pushes of [secrets and sensitive information](https://thoughtworks.github.io/talisman/)

## Development

From your terminal:

```sh
npm run dev
```

This starts your app in development mode, rebuilding assets on file changes.

## Deployment

First, build your app for production:

```sh
npm run build
```

Then run the app in production mode:

```sh
npm start
```

Now you'll need to pick a host to deploy it to.

### DIY

If you're familiar with deploying node applications, the built-in Remix app server is production-ready.

Make sure to deploy the output of `remix build`

- `build/`
- `public/build/`
