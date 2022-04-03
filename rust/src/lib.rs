use std::ffi::{CStr, CString};
use std::os::raw::c_char;

#[no_mangle]
pub extern fn rust_greeting(to: *const c_char) -> *mut c_char {
    let c_str = unsafe {
        CStr::from_ptr(to)
    };
    let recipient = match c_str.to_str() {
        Err(_) => "there",
        Ok(string) => string,
    };
    CString::new("Hello ".to_owned() + recipient).unwrap().into_raw()
}

#[no_mangle]
pub extern fn cstring_free(str: *mut c_char) {
    unsafe {
        if str.is_null() { return }
        CString::from_raw(str)
    };
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}
