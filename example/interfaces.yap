package main;

@import std-io as io;

interface Yapper {
    func Yap() string;
}

object Adam {
    func Yap() string {
        io.print("Stop yapping");
    }
}

object Yaro {
    func Yap() string {
        io.print("Viete co milan urobil vcera...");
    }
}

object Empty {

}

func yapper(y:  Yapper) void {
    y.Yap();
}

pub func main() void {
    let a = Adam();
    let y = Yaro();
    let e = Empty();

    yapper(a); // prints Stop yapping
    yapper(y); // prints Viete co milan urobil vcera

    yapper(e); // error Empty does not implement Yapper interface
}