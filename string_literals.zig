const print = @import("std").debug.print;
const mem = @import("std").mem; // will be used to compare bytes

pub fn main() void {
    const bytes = "hello";
    print("{}\n", .{@TypeOf(bytes)});
    print("{d}\n", .{bytes.len});
    print("{c}\n", .{bytes[1]});
    print("{d}\n", .{bytes[5]});
    // print("{d}\n", .{bytes[6]}); // error
    print("{}\n", .{'e' == '\x65'});
    print("{d}\n", .{'\u{1f4a9}'});
    print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});
    print("0x{x}\n", .{"\xff"[0]});
    print("{u}\n", .{'⚡'});

    const hello_world_in_c =
        \\ #include <stdio.h>
        \\
        \\ int main(int argc, char **argv) {
        \\     prinf("hello world\n");
        \\     return 0;
        \\ }
    ;

    print("C: {s}\n", .{hello_world_in_c});
}