# Docker Structurizr CLI

The Structurizr CLI Docker image allows the execution of
[Structurizr CLI](https://github.com/structurizr/cli) through Docker.

## Usage

### Create the image

From the root folder of the repository, you can build the Structurizr CLI Docker
imager running `docker build` as follows.

```bash
$ docker build . --tag local/structurizr:latest
```

### Pull the image

If you prefer to download the Docker image from Docker Hub, you can run the
following command to pull it from the registry.
You can replace `latest` with the desired tag.

```bash
$ docker pull gilbertotcc/structurizr:latest
```

### Run Structurizr CLI

The Docker image supports all the commands that Structurizr CLI supports:

- [push](https://github.com/structurizr/cli/blob/master/docs/push.md)
- [pull](https://github.com/structurizr/cli/blob/master/docs/pull.md)
- [export](https://github.com/structurizr/cli/blob/master/docs/export.md)

The following example shows the usage of the Structurizr Docker image to export
the workspace defined in `sample_arch.dsl` to a JSON representation.

```bash
$ docker run --rm -it -v $(pwd):/home local/structurizr:latest \
    export --workspace sample_arch.dsl --format json --output ./
```
