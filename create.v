module main

import os

fn main() {
    //files := os.ls(".") or { panic(err) }
    entries := os.read_file("./data.log") or { panic(err) }
    files := entries.split_into_lines()
    os.mkdir("./test",os.MkdirParams { mode: 0o777 } ) or { println("File created") }

    for file in files {
        //println("${file}")
        os.create("./test/${file}") or { panic(err) }
    }
    println("all files created.")
}
