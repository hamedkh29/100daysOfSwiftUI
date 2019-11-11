//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Liem Vo on 11/11/19.
//  Copyright © 2019 Liem Vo. All rights reserved.
//

import Foundation

extension Bundle {
	func decode<T: Decodable>(_ file: String) -> T {
		guard let url  = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "y-MM-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		return loaded
	}
}
