use cfg_if::cfg_if;

cfg_if! {
    if #[cfg(any(target_os = "macos",
                 target_os = "ios",
                 target_os = "watchos",
                 target_os = "tvos"))] {
        mod macos;
        pub use self::macos::*;
    } else if #[cfg(target_os = "freebsd")] {
        mod freebsd;
        pub use self::freebsd::*;
    } else {
        compile_error!("Doesn't support TFO on the current platform");
    }
}
