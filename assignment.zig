const std = @import("std");
const print = std.debug.print;

const x = 1234;

fn foo() void {
    // It works at file scope as well as inside functions.
    const y = 5678;
    // Once assigned, an identifier cannot be changed;
    y += 1;
}

pub fn main() void {
    // foo(); // error: cannot assign to constant
    var y: i32 = 5678;
    y += 1;
    print("{d}\n", .{y});

    // variables must be initialised
    // var z: i32; // error: variables must be initialized
    // z = 1;

    // undefined
    var w:i32 = undefined;
    w = 1; // type is no longer undefined
    print("{d}\n", .{w});
    print("{}\n", .{@TypeOf(w)}); // i32
}