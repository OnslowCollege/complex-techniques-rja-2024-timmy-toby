
//
//  main.swift
//  OCProgram
//
//  Created by Student Name on 1/01/23.
//

import Foundation

print("Enter your name: ", terminator: "")
let name = readLine(strippingNewline: true)

if let name = name {
    print("Hello, \(name)!")
} else {
    print("Error getting name.")
}

