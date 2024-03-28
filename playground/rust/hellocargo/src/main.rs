// To run: cargo run
// To build: cargo build

fn is_greater_than(x: i32, y: i32) -> bool {
   return x > y;  
}

fn main() {
    let x = 10;
    let y = 20;

    println!("x + y = {}", x + y);
    println!("x is {}, and y is {}", x, y);

    if is_greater_than(x, y) {
        println!("x is greater than y");
    } else {
        println!("x is not greater than y");
    }
}

