#[cfg(feature = "dev")]
pub fn fun() {
    println!("Dev!");
}

#[cfg(not(feature = "dev"))]
pub fn fun() {
    println!("Not dev");
}
