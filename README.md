Docker container to cross-compile for the raspberry pi 2

`docker pull danielfrg/rpi2xc`

## Example

Inside the `workspace` directory create `hello.c`:

```c
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
    return 0;
}
```

Run (replacing the volume parameter to a valid location on your computer)
````
docker run -v /Users/drodriguez/code/raspberrypi/rpi2xc/workspace:/workspace rpi2xc arm-linux-gnueabihf-gcc -o hello hello.c
```

And it will create a `hello` binary, if you execute it locally it will not work so move it to the pi with `scp workspace/hello pi@raspberry:.` and run it from there:

```
pi@raspberrypi ~ $ ./hello
Hello, world!
```

## Advanced


For more advanced stuff you might need to get the `/lib` and `/usr` from your raspberry pi.

Start up the pi and run in your laptop (where `raspberry` is the ip of the raspberry pi):

1. `rsync -rl --delete-after --safe-links pi@raspberry:/usr ./rootfs`
2. `rsync -rl --delete-after --safe-links pi@raspberry:/lib ./rootfs`

Share it to the container by adding
```
-v /Users/drodriguez/code/raspberrypi/rpi2xc/rootfs:/rootfs
```

## Building

`docker build -t rpi2xc .`
