package main;

@import std-io as io;

pub func main() void {
    if (io.read(getType(int))) | loc x |
    else {
        io.print("couldn't get first operand");
        return;
    }
    
    if (io.read(getType(int))) |loc y|
    else {
        io.print("couldn't get second operand");
        return;
    }

    let z:int? = 7;

    if (z) |safeZ| {
        y = y + safeZ;
    }

    let a:int = check z or Error("z was null");
}