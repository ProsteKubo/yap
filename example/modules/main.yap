package main;

// library import
@import std-io as io;
// local import
#import custom-math as math;

pub func main() void {
    io.print(try math.safeDivide(5, 3) or error);
}