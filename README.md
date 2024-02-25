


# aeneas-docker

[Aeneas](https://www.readbeyond.it/aeneas/) automatically generates a synchronization map between a list of text fragments and an audio file containing the narration of the text. In computer science this task is known as (automatically computing a) forced alignment.

## Prerequisites

Docker installed on your machine. You can download it from [Docker's official website](https://www.docker.com/).


## Pull the Docker Image
First, pull the `iskoldt/aeneas:latest` Docker image from the Docker registry:

```bash
docker pull iskoldt/aeneas:latest
```

## Usage

To run the `iskoldt/aeneas:latest` image without any arguments and see the usage message, use the following command:

```bash
docker run --rm iskoldt/aeneas:latest python3 -m aeneas.tools.execute_task
docker run --rm iskoldt/aeneas:latest python3 -m aeneas.tools.execute_job
```
## Synchronizing Audio with Text

To synchronize your audio file with the corresponding text, you can use the `execute_task` command. Make sure to mount the directory containing your audio and text files into the container using the `-v` option. Here's an example:

You can also get a list of live examples that you can immediately run on your machine thanks to the included files:

```bash
docker run --rm -v $(pwd):/app iskoldt/aeneas:latest python3 -m aeneas.tools.execute_task \
  /app/test.mp3 \
  /app/test1.txt \
  "task_language=eng|os_task_file_format=json|is_text_type=plain" \
  /app/map.json
```
In this command:

- `--rm` automatically removes the container when it exits.
- `-v $(pwd):/app` mounts the current directory (`$(pwd)`) to `/app` in the container, allowing the container to access the files.
- `iskoldt/aeneas:latest` specifies the Docker image to use.
- The arguments after `iskoldt/aeneas:latest` are passed to the `python3 -m aeneas.tools.execute_task` command inside the container, specifying the audio file (`test.mp3`), the text file (`test1.txt`), the task configuration, and the output file (`map.json`).


## Note

Replace `test.mp3` and `test1.txt` with the paths to your own audio and text files, respectively.
Adjust the command options (`task_language`, `os_task_file_format`, `is_text_type`) as needed for your specific use case.


## License
[GNU AFFERO GENERAL PUBLIC LICENSE](https://github.com/oyekamal/aeneas-Docker/blob/main/LICENSE)
