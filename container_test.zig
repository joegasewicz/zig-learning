const std = @import("std");
const expect = std.testing.expect;

const imported_file = @import("zig_test.zig");

test    {
    // reference all tests
    // std.testing.refAllDecls(@This());
    // OR
    _ = S;
    _ = U;
    _ = @import("zig_test.zig");
}

const S = struct {
    test "zig test #1" {
        try expect(true);
    }

    test "expect this to fail" {
        return error.SkipZigTest;
    }

    const SE = enum {
        V,
        // won't run
        test "This test won't run" {
            try expect(false);
        }
    };
};

const U = union {
    s: US,
    const US = struct {
        test "U.US demo test" {
            try expect(false);
        }
    };

    test "U demo test" {
        try expect(true);
    }


};

// test "async test" {
//     var frame = async func();
//     const result = await frame;
//     try std.testing.expect(result == 1);
// }
//
// fn func() i32 {
//     suspend {
//         resume @frame();
//         return 1;
//     }
// }


pub fn main() void {

}


