# aws-mfa

Simple docker image to run [`aws-mfa`][] on your machine without having to install Python, etc to get going.

Mount your `~/.aws` folder under `/root` to have it operate on your profile, pass any other arguments you want to `docker run`.

## Usage

To refresh with the max token length possible:

```sh
docker run --rm --interactive --tty --volume $HOME/.aws:/root/.aws caius/aws-mfa:latest --duration 129600
```

You can also set up a shell alias locally so you don't need to run all that:

```sh
alias aws-mfa="docker run --rm --interactive --tty --volume \$HOME/.aws:/root/.aws caius/aws-mfa:latest --duration 129600"
```

[`aws-mfa`]: https://pypi.org/project/aws-mfa/

## License

MIT Licensed, see `LICENSE` for details.
