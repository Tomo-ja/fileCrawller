//
//  main.swift
//  MiniProject-FileTree
//
//  Created by Tomonao Hashiguchi on 2022-07-13.
//

import Foundation

print("Hello, World!")

struct PrefixSign {
	static let rightDown = "├─"
	static let right = "└─"
	static let down = "│"
}

let fileManager = FileManager.default
// for production
//let path = fileManager.currentDirectoryPath

// for development
let path = "/Users/tomo/Desktop/ciccc/MOBILE/MiniProject-FileTree/MiniProject-FileTree"

let index = path.lastIndex(of: "/")!
let searchTargetDirectroy = path[path.index(after: index)...]

print(path)
print(searchTargetDirectroy)

func makeFileTree(in dir: String, prefix: String) {
	do {
		let files = try FileManager.default.contentsOfDirectory(atPath: dir)
		
		for (index, file) in files.enumerated() {
			if index == files.count - 1 {
				if let _ = file.firstIndex(of: "."){
					print("\(prefix) └─ \(file)")
				} else {
					makeFileTree(in: dir + "/\(file)", prefix: " \(PrefixSign.down)   " + prefix)
					print("\(prefix) └─ \(file)")
				}
			} else {
				print("\(prefix) ├─ \(file)")
			}
		}
	} catch {
		print("Name of \(dir) is not exist")
	}
}

makeFileTree(in: path, prefix: "")


