package main;

@import std-io as io;

func safeDivide(x: int, y: int) int or Error {
    if (y == 0) {
        return Error("division by zero");
    }

    return x / y;
}

pub func main() void {
    if (io.read(getType(int))) | loc x | {
        io.print("couldn't get first operand");
        return;
    }
    
    if (io.read(getType(int))) |loc y| {
        io.print("couldn't get second operand");
        return;
    }

    if (safeDivide(x, y)) | result | {
        // it is valid value
        io.print(result);
    } else | error |  {
        // it is error here
        io.print(error);
    }

    let y = 5 + 5;

    let x:int = 5;
    let y = 10;
}