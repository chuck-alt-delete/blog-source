# blog-source

Source content for chuck-alt-delete.github.io.

# Update submodules

```bash
git submodule foreach git pull
```

Note: After pulling from a different computer, I had an issue with the submodule in the `public` folder, so I deleted that folder and ran 

    git clone https://github.com/chuck-alt-delete/chuck-alt-delete.github.io.git public

That seemed to work.
# Build and Publish to chuck-alt-delete.github.io

```
./build.sh
```