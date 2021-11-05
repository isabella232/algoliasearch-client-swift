//
//  RefineResultsSnippets.swift
//  
//
//  Created by Vladislav Fitc on 03/11/2021.
//

import Foundation
import AlgoliaSearchClient

struct RefineResultsSnippets: SnippetsCollection {
  var replicaIndex: Index { return index }
}

//MARK: - Sorting

extension RefineResultsSnippets {
  
  func set_standard_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["products_standard_price_desc"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func standard_replica_settings() {
    let replicaIndex = client.index(withName: "products_standard_price_desc")
    
    let settings = Settings()
      .set(\.ranking, to: [
        .desc("price"),
        "typo",
        "geo",
        "words",
        "filters",
        "proximity",
        "attribute",
        "exact",
        "custom"
      ])
    
    replicaIndex.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_virtual_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["virtual(products_virtual_price_desc)"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func virtual_replica_settings() {
    let replicaIndex = client.index(withName: "products_standard_price_desc")
    
    let settings = Settings()
      .set(\.customRanking, to: [.desc("price")])
    
    replicaIndex.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_standard_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["articles_date_desc"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func standard_replica_settings() {
    let settings = Settings()
      .set(\.replicas, to: [
        .desc("post_date_timestamp"),
        "typo",
        "geo",
        "words",
        "filters",
        "proximity",
        "attribute",
        "exact",
        "custom"
      ])
    
    replicaIndex.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_virtual_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["virtual(articles_date_desc)"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func virtual_replica_settings() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .desc("post_date_timestamp")
      ])
    
    replicaIndex.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func sort_alphabetic_standard_replicas() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .asc("textual_attribute")
      ])
      .set(\.ranking, to: [
        "custom",
        "typo",
        "geo",
        "words",
        "filters",
        "proximity",
        "attribute",
        "exact"
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func sort_alphabetic_virtual_replicas() {
    let settings = Settings()
      .set(\.customRanking, to: [.asc("textual_attribute")])
      .set(\.relevancyStrictness, to: 0)
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func creating_replicas_default_settings() {
    let settings = Settings()
      .set(\.ranking, to: [
        .asc("price"),
        "typo",
        "geo",
        "words",
        "filters",
        "proximity",
        "attribute",
        "exact",
        "custom"
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["product_price_desc"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_virtual_replicas() {
    let settings = Settings()
      .set(\.replicas, to: ["virtual(product_price_desc)"])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func replica_settings() {
    let settings = Settings()
      .set(\.replicas, to: ["virtual(product_price_desc)"])
    
    replicaIndex.setSettings([
      "ranking": [
        "desc(price)",
        "typo",
        "geo",
        "words",
        "filters",
        "proximity",
        "attribute",
        "exact",
        "custom"
      ]
    ])
  }
  
}

//MARK: - Filtering

extension RefineResultsSnippets {
}

//MARK: - Faceting

extension RefineResultsSnippets {
}

//MARK: - Grouping

extension RefineResultsSnippets {
}

//MARK: - Geolocation

extension RefineResultsSnippets {
}

