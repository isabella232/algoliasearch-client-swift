//
//  DictionariesSnippets.swift
//  
//
//  Created by Vladislav Fitc on 11/02/2021.
//

import Foundation
import AlgoliaSearchClient

struct DictionariesSnippets: SnippetsCollection {}

//MARK: - Save dictionary entries

extension DictionariesSnippets {
  
  func saveStopWords() {
    let entry = StopwordsDictionary.Entry(objectID: "down",
                                          language: .english,
                                          word: "down",
                                          state: .enabled)
    
    client.saveDictionaryEntries(to: StopwordsDictionary.self, dictionaryEntries: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
    
  func savePlurals() {
    let entry = PluralsDictionary.Entry(objectID: "chevaux",
                                        language: .french,
                                        words: ["cheval", "chevaux"])
    
    client.saveDictionaryEntries(to: PluralsDictionary.self, dictionaryEntries: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func saveCompounds() {
    let entry = CompoundsDictionary.Entry(objectID: "kopfschmerztablette",
                                          language: .german,
                                          word: "kopfschmerztablette",
                                          decomposition: ["kopf", "schmerz", "tablette"])
    
    client.saveDictionaryEntries(to: CompoundsDictionary.self, dictionaryEntries: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Replace dictionary entries

extension DictionariesSnippets {
  
  func replaceStopWords() {
    let entry = StopwordsDictionary.Entry(objectID: "down",
                                          language: .english,
                                          word: "down",
                                          state: .enabled)
    
    client.replaceDictionaryEntries(in: StopwordsDictionary.self, with: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
    
  func replacePlurals() {
    let entry = PluralsDictionary.Entry(objectID: "chevaux",
                                        language: .french,
                                        words: ["cheval", "chevaux"])
    
    client.replaceDictionaryEntries(in: PluralsDictionary.self, with: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func replaceCompounds() {
    let entry = CompoundsDictionary.Entry(objectID: "kopfschmerztablette",
                                          language: .german,
                                          word: "kopfschmerztablette",
                                          decomposition: ["kopf", "schmerz", "tablette"])
    
    client.replaceDictionaryEntries(in: CompoundsDictionary.self, with: [entry]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
}

//MARK: - Delete dictionary entries

extension DictionariesSnippets {
  
  func deleteEntires() {
    client.deleteDictionaryEntries(from: StopwordsDictionary.self, withObjectIDs: ["down", "up"]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func clearEntires() {
    client.clearDictionaryEntries(in: StopwordsDictionary.self) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }

  
}

//MARK: - Search dictionary entries

extension DictionariesSnippets {
  
  func searchEntries() {
    let query = DictionaryQuery(query: "und")
      .set(\.language, to: .german)

    client.searchDictionaryEntries(in: StopwordsDictionary.self, query: query) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Set dictionary settings

extension DictionariesSnippets {
  
  func setSettings() {
    let settings = DictionarySettings(disableStandardEntries: .init(stopwords: [.english: true]))
    
    client.setDictionarySettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func resetSettings() {
    let settings = DictionarySettings(disableStandardEntries: .none)
    
    client.setDictionarySettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }

  
}

//MARK: - Get dictionary settings

extension DictionariesSnippets {
  
  func getSettings() {
    client.getDictionarySettings { result in
      if case .success(let settings) = result {
        print("Dictionary settings: \(settings)")
      }
    }
  }
  
}





