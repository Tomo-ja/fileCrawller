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

// print parent directry of code called
let index = path.lastIndex(of: "/")!
let searchTargetDirectroy = path[path.index(after: index)...]
print(searchTargetDirectroy)

// because of complied code will recoganize as directroy number is not 0
var numberOfFile = 1
var numberOfDir = -1

func makeFileTree(in dir: String, prefix: String) {
	do {
		let files = try fileManager.contentsOfDirectory(atPath: dir)
		
		for (index, file) in files.enumerated() {
			
			let isEndOfLevel = index == files.count - 1
			let sign = isEndOfLevel ? " └─ " : " ├─ "
			let padding = isEndOfLevel ? "     " : " │   "
			
			if let _ = file.firstIndex(of: "."){
				numberOfFile += 1
				print(prefix + sign + file)
			} else {
				numberOfDir += 1
				print(prefix + sign + file)
				makeFileTree(in: dir + "/\(file)", prefix: prefix + padding)
			}
		}
	} catch {
	}
}

makeFileTree(in: path, prefix: "")
print("\(numberOfDir) directories, \(numberOfFile) files")
