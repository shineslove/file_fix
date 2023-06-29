module main

import os
import arrays

fn main() {
	files := os.ls('.') or { panic(err) }
	for file in files {
		ext := os.file_ext(file)
		new_file := file.split(' ')#[2..].join(' ')
		mut parsed_file := arrays.flatten(new_file.split('.').map(it.split(' ')))
		parsed_file.pop()
		change_name := parsed_file.filter(!it.contains('(') && !it.contains(')')).join(' ') + ext
		os.rename('./test/${file}', './test/${change_name}') or { println("couldn't rename") }
	}
	println('all files renamed')
}
