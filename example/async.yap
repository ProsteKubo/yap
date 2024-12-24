package main;
@import threading as th;
@import std-io as io;

async func timeout(x: int) Task {
    await th.sleep(x);
}

async func printer() Task<int> {
    io.print("Started waiting");
    await timeout(10);
    io.print("Continuing");
    return 5;
}

pub func main() void {
    let x = printer();

    for (let i = 0; i < 10; i++) {
        io.print(i);
    }

    let xValue = wait x;
}