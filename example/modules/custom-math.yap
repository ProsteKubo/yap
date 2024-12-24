package custom-math;

pub func safeDivide(a: int, b: int) int or Error {
    if (b == 0) {
        return Error("couldn't divide");
    }
    
    return a / b;
}