#![feature(lang_items)]
#![feature(ptr_internals)]
#![no_std]

extern crate volatile;
extern crate spin;

mod vga_buffer;

use core::panic::PanicInfo;

#[lang = "eh_personality"]
extern fn eh_personality() {}

#[panic_handler]
extern fn rust_begin_panic(info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern fn kmain() -> ! {
    let mut i = 0;
    while i < 5 {
        vga_buffer::write("Hello World!\n");
        i = i+1;
    }

    loop {}
}
