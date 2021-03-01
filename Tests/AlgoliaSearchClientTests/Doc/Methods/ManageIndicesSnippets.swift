//
//  ManageIndicesSnippets.swift
//  
//
//  Created by Vladislav Fitc on 01/07/2020.
//

import Foundation
import AlgoliaSearchClient

struct ManageIndicesSnippets: SnippetsCollection {}

//MARK: - List indices

extension ManageIndicesSnippets {
  
  static var listIndices = """
  client.listIndices(
    requestOptions: __RequestOptions?__ = nil,
    completion: __Result<IndicesListResponse> -> Void__
  )
  """
  
  func listIndices() {
    client.listIndices { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Delete index

extension ManageIndicesSnippets {
  
  static var deleteIndex = """
  index.delete(
    requestOptions: __RequestOptions?__ = nil,
    completion: __Result<WaitableWrapper<IndexDeletion>> -> Void__
  )
  """
  
  func deleteIndex() {
    index.delete { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func deleteAllIndices() {
    
    // Primary indices only
    client.listIndices { result in
      guard case .success(let response) = result else {
        return
      }
      let operations = response.items
        .filter { $0.primary == nil }
        .map(\.name)
        .map { ($0, BatchOperation(action: .delete)) }
      client.multipleBatchObjects(operations: operations) { result in
        guard case .success(let response) = result else {
          return
        }
        print(response.batchesResponse.objectIDs)
      }
    }
    
    // Primary and replica indices
    client.listIndices { result in
      guard case .success(let response) = result else {
        return
      }
      
      let primaryIndicesDeleteOperations = response.items
        .filter { $0.primary == nil }
        .map(\.name)
        .map { ($0, BatchOperation(action: .delete)) }

      let replicaIndicesDeleteOperations = response.items
        .filter { $0.primary != nil }
        .map(\.name)
        .map { ($0, BatchOperation(action: .delete)) }

      
      client.multipleBatchObjects(operations: primaryIndicesDeleteOperations) { result in
        guard case .success(let response) = result else {
          return
        }
        response.wait { result in
          guard case .success = result else {
            return
          }
          print("Done deleting primary indices")
          client.multipleBatchObjects(operations: replicaIndicesDeleteOperations) { result in
            guard case .success = result else {
              return
            }
            print("Done deleting replica indices")
          }
        }
      }
    }
    
    func deleteSubsetOfIndices() {
      client.listIndices { result in
        guard case .success(let response) = result else {
          return
        }
        let deleteOperations: [(IndexName, BatchOperation)] = response.items
          .map(\.name)
          .filter { $0.rawValue.contains("test_") }
          .map { ($0, .delete) }
        
        client.multipleBatchObjects(operations: deleteOperations) { result in
          guard case .success = result else {
            return
          }
          print("Response: \(response)")
        }
      }
    }

  }
  
}

//MARK: - Copy index

extension ManageIndicesSnippets {
  
  static var copyIndex = """
  client.copyIndex(
    from [source](#method-param-indexnamesrc): __IndexName__,
    to [destination](#method-param-indexnamedest): __IndexName__,
    #{scope}: __Scope__ = .all,
    requestOptions: __RequestOptions?__ = nil,
    completion: __Result<WaitableWrapper<IndexRevision>> -> Void__
  )

  ClientAccount.copyIndex(
    [source](#method-param-indexsrc): __Index__,
    [destination](#method-param-indexdest): __Index__,
    requestOptions: RequestOptions? = nil,
    completion: __Result<WaitableWrapper<[Task]>, Swift.Error>) -> Void__
  )
  """
  
  func copyIndex() {
    // Copy indexNameSrc to indexNameDest
    client.copyIndex(from: "indexNameSrc", to: "indexNameDest") { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func partialCopyIndex() {
    // Copy settings and synonyms (but not rules) from "indexNameSrc" to "indexNameDest".
    client.copyIndex(from: "indexNameSrc",
                     to: "indexNameDest",
                     scope: [.settings, .synonyms]) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
  func crossAppCopyIndex() throws {
    let index1 = SearchClient(appID: "APP_ID_1", apiKey: "API_KEY_1").index(withName: "index1")
    let index2 = SearchClient(appID: "APP_ID_2", apiKey: "API_KEY_2").index(withName: "index2")

    try AccountClient.copyIndex(source: index1, destination: index2) { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Move index

extension ManageIndicesSnippets {
  
  static var moveIndex = """
  client.moveIndex(
    from [source](#method-param-indexnamesrc): __IndexName__,
    to [destination](#method-param-indexnamedest): __IndexName__,
    requestOptions: __RequestOptions?__ = nil,
    completion: __Result<WaitableWrapper<IndexRevision>> -> Void__
  )
  """
  
  func moveIndex() {
    // Rename indexNameSrc to indexNameDest (and overwrite it)
    client.moveIndex(from: "indexNameSrc", to: "indexNameDest") { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

//MARK: - Index exists

extension ManageIndicesSnippets {
  
  static var indexExists = """
  index.exists(completion: __Result<Bool> -> Void__)
  """
  
  func indexExists() {
    index.exists { result in
      if case .success(let response) = result {
        print("Response: \(response)")
      }
    }
  }
  
}

