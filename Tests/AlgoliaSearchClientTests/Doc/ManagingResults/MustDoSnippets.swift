//
//  MustDoSnippets.swift
//  
//
//  Created by Vladislav Fitc on 03/11/2021.
//

import Foundation
import AlgoliaSearchClient

struct MustDoSnippets: SnippetsCollection {
  
}

//MARK: - Configuring searchable attributes the right way

extension MustDoSnippets {
  
  func api_searchable_different_priority_example() {
    let settings = Settings()
      .set(\.searchableAttributes, to: [
        "title",
        "director",
        "actor"
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func api_searchable_same_priority_example() {
    let settings = Settings()
      .set(\.searchableAttributes, to: [
        "movie_title,actor_name,director_name",
        "cast",
        "filmography"
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func api_ordering_example() {
    let settings = Settings()
      .set(\.searchableAttributes, to: [
        .unordered("title"),
        "cast"
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Custom ranking

extension MustDoSnippets {
  
  func configure_custom_ranking() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .desc("retweets"),
        .desc("likes")
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func set_custom_ranking() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .desc("boosted")
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func controlling_custom_ranking_metrics_precision_before() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .desc("pageviews"),
        .desc("comments")
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func controlling_custom_ranking_metrics_precision_after() {
    let settings = Settings()
      .set(\.customRanking, to: [
        .desc("rounded_pageviews"),
        .desc("comments")
      ])
    
    index.setSettings(settings) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}
