package main;

@import std-io as io;

object Person {
    int age;
    string name;
    int scale;

    // current object
    pub func Yap() void {
        Print("My name is ", this.name);
    }

    // current object as pointer
    pub funcp Yap() void {
        Print("My name is ", this->name);
    }

    func Print(message: string, name: string) void {
        io.Print(message);
        io.Print(name);
    }
}

pub func main() void {
    let p = new Person{name = "Yapper", age = 10, scale = 99};
    // or 
    let p = new Person{10, "Yapper", 99};

    p.Yap();
    p.Print("a", "b"); // error not accessible
}