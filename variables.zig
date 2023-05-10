const std = @import("std");
const stdout = std.io.getStdOut().writer();
const expect = std.testing.expect;
const assert = std.debug.assert;

const @"identifier with spaces in it" = 0xff;
const @"1SmallStp4Man" = 112358;

const c = @import("std").c;
pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.Stat) c_int;

const Color = enum {
    red,
    @"really red",
};

const color: Color = .@"really red";

// Container level
var y: i32 = add(10, x);
const x: i32 = add(12, 34);

test "container level variables" {
    try expect(x == 46);
    try expect(y == 56);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

// Namespace container
test "namespaced container level variables" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

const S = struct {
    var x: i32 = 1234;
};

fn foo() i32 {
    S.x += 1;
    return S.x;
}

// Static local variables
test "static local variables" {
    try expect(foo2() == 1235);
    try expect(foo2() == 1236);
}

fn foo2() i32 {
    const T = struct {
        var x: i32 = 1234;
    };
    T.x += 1;
    return T.x;
}

// Thread local variables
threadlocal var z: i32 = 1234;

test "thread local storage" {
    const thread1 = try std.Thread.spawn(.{}, testTls, .{});
    const thread2 = try std.Thread.spawn(.{}, testTls, .{});
    testTls();
    thread1.join();
    thread2.join();
}

fn testTls() void {
    assert(z == 1234);
    z += 1;
    assert(z == 1235); // each thread assign this same value
}

// Local variables
test "comptime vars" {
    var a: i32 = 1;
    comptime var b: i32 = 1;

    a += 1;
    b += 1;

    try expect(a == 2);
    try expect(b == 2);

    try expect(a == 2);
    try expect(b == 2);

    try stdout.print("comptime b: {}\n", .{b});
    if (b != 2) {
        @compileError("wrong value for b");
    }
}

pub fn main() !void {
    try stdout.print("color: {}\n", .{color}); //color: variables.Color.really red
}
