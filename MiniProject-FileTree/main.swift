//
//  main.swift
//  MiniProject-FileTree
//
//  Created by Tomonao Hashiguchi on 2022-07-13.
//

import Foundation

let fileManager = FileManager.default

// for production
let path = fileManager.currentDirectoryPath

// for development
//let path = "/Users/tomo/Desktop/ciccc/MOBILE/MiniProject-FileTree/MiniProject-FileTree"

let index = path.lastIndex(of: "/")!
let searchTargetDirectroy = path[path.index(after: index)...]

print(searchTargetDirectroy)

func makeFileTree(in dir: String, prefix: String) {
	do {
		let files = try FileManager.default.contentsOfDirectory(atPath: dir)
		
		for (index, file) in files.enumerated() {
			
			let isEndOfLevel = index == files.count - 1
			let sign = isEndOfLevel ? " └─ " : " ├─ "
			let padding = isEndOfLevel ? "     " : " │   "
			
			if let _ = file.firstIndex(of: "."){
				print(prefix + sign + file)
			} else {
				print(prefix + sign + file)
				makeFileTree(in: dir + "/\(file)", prefix: prefix + padding)
			}
		}
	} catch {
	}
}

makeFileTree(in: path, prefix: "")
