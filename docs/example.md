# Documentation Template

## YAP Language Documentation

Welcome to the official documentation for YAP (Yet Another Programming Language). This document is designed to guide you through the features, syntax, and tools available in YAP. As this is a work in progress, new sections will be added as the language evolves.

---

### 📖 Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Language Basics](#language-basics)
    - TODO: Add subsections
5. [Tooling and Build System](#tooling-and-build-system)
6. [Examples](#examples)

---

### Introduction

YAP is a new programming language designed to be simple, efficient, and easy to use.
Written entirely in C, it utilizes CMake and Clang for building and compilation.
It has 3 different engines for execution: interpreter, vm(runtime) compiler, and LLVM compiler.
For now has no memory allocation, but the vision is to have a garbage collector and user controlled arenas.
Standard library is written in YAP itself, and it is a part of the main repository. 
It will contain basic functions for IO, math, complex numbers computation and other basic operations.
On top of that it will have basic data structures like arrays, lists, maps, sets, and queues.
Thanks to generic types, it will have multitude of algorithms for sorting, searching, and other operations.
It will have support for concurrency(async/await) and later on for parallelism.
The final goal is to implement http 1.4 client (later maybe even 2xx) and port simple GUI library.
---

### Installation

Instructions on setting up YAP:
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/yap.git
   cd yap
   ```
2. Build YAP using CMake and Clang:
   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```
3. Verify installation by running:
   ```bash
   ./yap --version
   ```

---

### Getting Started

- Write your first YAP program:
   ```yap
    @import std-io as io

    func main() void {
        io.print("Hello, World!");
    }
   ```
- Save it as `hello_world.yap` and run it:
   ```bash
   ./yap hello_world.yap
   ```

---

### Language Basics

#### Syntax Overview
- Overview of how YAP code is structured.
- Example:
   ```yap
   @import std-io as io

    func main() void {
      io.print("Hello, World!");
    }
   ```

#### Constants, Readonly and Variables
- Variable or constant can have a type or be inferred, but this type cannot be changed.
- Nullability is also supported, and shown by adding a `?` to the type.
- There are 3 types of variables: `let`, `const`, and `readonly`.
- - `let` is a mutable variable.
- - `const` is a constant which can be mutated but cannot be reassigned.
- - `readonly` is an immutable variable that can only be assigned once.
- Example:
   ```yap
   let name = "YAP"; // inferred as string
   let surname: string = "PAY"; // explicit type
   let existance: string? = null; // nullable string
   const version = 0.1; // inferred as float
   readonly pi = 3.14159; // inferred as float
   ```

#### Type system
- Basic data types include `int`, `float`, `complex`, `char`, `string`, `bool`, and `void`.
- Example:
   ```yap
   let age: int = 25;
   let pi: float = 3.14159;
   let c: complex = 1.0 + 2.0i;
   let letter: char = 'A';
   let name: string = "YAP";
   let is_valid: bool = true;
   let nothing: void = void;
   ```
- User-defined types can be created using `object` and `enum`.
- Example:
   ```yap
   object Person {
       let name: string;
       let age: int;
   }

   enum Color {
       Red,
       Green,
       Blue
   }
   ```
- Type casting is done using `as` keyword. Implicit casting is not allowed.
- Example:
   ```yap
   let x: float = 3.14;
   let y: int = x as int;
   ```
- Type inference is supported for variables.
- Example:
   ```yap
   let x = 5; // inferred as int
   let y = 3.14; // inferred as float
   ```

#### Control Structures
- YAP supports `if`, `else`, `else if`, `while`, `for`, and `switch` statements.
- Example:
   ```yap
   if (x > 0) {
       print("Positive number");
   } else if (x < 0) {
       print("Negative number");
   } else {
       print("Zero");
   }
   ```
- Switch will support `case`, `default`, and `break` statements. Also, later it will support pattern matching.
- Example:
   ```yap
   switch (x) {
       case 1:
           print("One");
           break;
       case 2:
           print("Two");
           break;
       default:
           print("Other");
   }
   ```
- Loops can be controlled using `break` and `continue`.
- Example:
   ```yap
   let i = 0;
   while (i < 10) {
       if (i == 5) {
           i += 2;
           continue;
       }
       print(i);
       i += 1;
   }
   ```
- For loop can be used to iterate over ranges or collections.
- Example:
   ```yap
   for (let i = 0; i < 10; i += 1) {
       print(i);
   }
    
    for (let item in items) {
         print(item);
    }
   ```
- Pattern matching with `match` and `case` statements.
- Example:
    ```yap
    TODO: finish this
    ```
- `defer` statement to execute code at the end of the scope.
- Example:
    ```yap
    func main() void {
        defer print("Goodbye, World!");
        print("Hello, World!");
    }
    ```
- Asynchronous code will be handled using `async` and `await` keywords.
- Example:
    ```yap
    async func main() void {
        let result = await fetchData();
        print(result);
    }
    ```
---
- For nullable types, | | construct can be used after while and if statements.
- Example:
    ```yap
    let x: int? = null;
    if (x) |safeX| {
        print(safeX);
        if (safeX > 0) {
            print("Positive number");
        }
    }
    ```
- Not nullable types cannot be assigned to nullable variable without this check.

#### Interfaces
- Interfaces can be defined using the `interface` keyword.
- Example:
   ```yap
   interface Printable {
       func print(): void;
   }
   ```
- Any object that implements this interface automatically is this interface. It is implicit and does not need to be declared.
- Example:
   ```yap
   object Person {
       let name: string;
       let age: int;

       func print() void {
           print("Name: " + name + ", Age: " + age);
       }
   }
   ```
  
#### Functions
- Functions can be defined using the `func` keyword.
- Example:
   ```yap
   func add(x: int, y: int) int {
       return x + y;
   }
   ```
- Functions can have optional parameters with default values.
- Example:
   ```yap
   func greet(name: string, greeting: string = "Hello") {
       print(greeting + ", " + name + "!");
   }
   ```
- Functions can return errors or value using `or` keyword.
- Example:
   ```yap
   func divide(x: float, y: float) float or Error {
       if (y == 0) {
           return Error("Division by zero");
       }
       return x / y;
   }

   func main() void {
       let result = divide(10.0, 2.0);
       if (result) { // result is value
           print("Result: " + result);
       } else if(!result) { // result is error
           print("Error: " + result.message);
       }
   }
   ```
- Functions can be defined as `async` to run asynchronously. Async function can be awaited from non async function using `wait` keyword. They can also be ran asynchronously using `await` keyword.
- Example:
   ```yap
   async func fetchData() string {
       return await fetch("https://api.example.com/data");
   }
   ```
- Functions can be made public using `pub` keyword. They are private by default.
- Example:
   ```yap
   pub func add(x: int, y: int) int {
       return x + y;
   }
   ```

#### Modules
- Modules can be imported using the `@import/as` directive.
- Example:
   ```yap
   @import std-io as io
   ```
- Modules can be defined using the `module` keyword.
- Example:
   ```yap
   module math;
   func add(x: int, y: int) int {
       return x + y;
   }
   ```
- User defined modules can be imported using the `#import/as` directive.
- Example:
   ```yap
   #import math as math
   ```
- Every program must have main module which is the entry point of the program.
- Example:
   ```yap
   module main;
   pub func main() void {
       print("Hello, World!");
   }
   ```
- Modules can be used to organize code and avoid naming conflicts.
- One module can spread over multiple files. They can be imported using `#import` directive.
- Functions can be defined in any order in the module.
- Public functions from other modules can be used by importing them 
- Example:
   ```yap
   #import math as math
   pub func main() void {
       let result = math.add(2, 3);
       print("Result: " + result);
   }
   ```

---

### Tooling and Build System

- YAP compiler has 3 steps:
- - Lexing, Parsing and Semantic Analysis which produces one AST file
- - Code generation which produces optimized IR file
- - Execution using one of the engines
- Usage:
   ```bash
   yap <source_file>.yap <source_file>.yap <source_file>.yap --engine=<engine>
   ```

---

### Examples
- TODO: add this later on

---
