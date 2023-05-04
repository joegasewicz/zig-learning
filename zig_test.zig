//! zig test zig_test.zig
const std = @import("std");
const expect = std.testing.expect;

test "expect addOne adds one to 41" {
    try expect(addOne(41) == 42);
    // try std.testing.expect(addOne(41) == 41); // 0 passed; 0 skipped; 1 failed.
}

fn addOne(number: i32) i32 {
    return number + 1;
}
