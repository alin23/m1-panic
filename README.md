## Dependencies

```sh
brew install fish node entr
```

## Triggering the panic

```sh
make panic
```

Wait for the CSS to be compiled. You should see output similar to:

```sh
npx --yes tailwindcss --jit -i temp.css -o app.css -w & \
        echo temp.css | entr -s 'echo "New files"'
New files
fish returned exit code 0

warn - You have enabled the JIT engine which is currently in preview.
warn - Preview features are not covered by semver, may introduce breaking changes, and can change at any time.

Rebuilding...
Done in 69ms.
```

**Press <kbd>ctrl</kbd> <kbd>c</kbd>. This should trigger the CPU panic and freeze your Mac device.**

#### What I'm experiencing on my M1 MacBook Pro 2020:

* System freeze (can't move the mouse, trackpad doesn't click, keyboard does nothing)
* Fans start spinning to maximum speed
* After a few seconds I see a pink screen flash for half a second
* The MacBook restarts automatically
* I see the login screen and I can login and use the device normally again
