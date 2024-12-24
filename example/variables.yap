package main;

@import std-io as io;

object Human {
    int age;
}

pub func main() void {
    let x: Human = new Human();
    x.age = 5;
    x = new Human();

    const y: Human = new Human();
    y.age = 5; // valid
    y = new Human(); // error can't reasign constant

    readonly z: Human = new Human();
    z.age = 5; // error can't modify readonly variable
    z = new Human(); // error can't reasign readonly variable

    final a: Human = new Human();
    a.age = 5; // error can't modify final variable
    a = new Human(); // valid
    
}