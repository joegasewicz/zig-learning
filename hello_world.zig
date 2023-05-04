const std = @import("std");
const print = @import("std").debug.print;

pub fn say_hi() void { // avoid handling errors with `void`
    print("Hi!\n", .{});
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
    say_hi();
}
