# blog-source

Source content for chuck-alt-delete.github.io.

## Setup

Install [Hugo](https://gohugo.io).

## Update Submodules

```bash
git submodule foreach git pull
```

Note: After pulling from a different computer, I had an issue with the submodule in the `public` folder, so I deleted that folder and ran 

    git clone https://github.com/chuck-alt-delete/chuck-alt-delete.github.io.git public

That seemed to work.

# New Post

Create.

```
hugo new content/posts/<my-new-post>.md
```

Preview.

```
hugo serve
```

# Build and Publish to chuck-alt-delete.github.io

```
./build.sh
```

# License

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg