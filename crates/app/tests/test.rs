#[test]
fn some_test() {
    let app = std::env!("CARGO_BIN_EXE_app");
    assert!(app.ends_with("app"));
}
