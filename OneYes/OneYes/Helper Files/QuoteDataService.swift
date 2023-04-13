//
//  QuoteDataService.swift
//  OneYes
//
//  Created by iMac Pro on 4/3/23.
//

import UIKit

struct QuoteDataService {
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

struct QuoteData {
    
    static var quotesData: [Quote] = QuoteDataService.load("quotesData.json")
    
    static func loadRandomQuote(for quoteString: UILabel) {
        let index = Int.random(in: 0..<quotesData.count)
        let quote = quotesData[index].quote
        let author = quotesData[index].author
        quoteString.text = "\"\(quote)\" -\(author)"
        quoteString.attributedText = NSMutableAttributedString()
            .italics("\"\(quote)\"")
            .bold(" -\(author)")
    }
}

