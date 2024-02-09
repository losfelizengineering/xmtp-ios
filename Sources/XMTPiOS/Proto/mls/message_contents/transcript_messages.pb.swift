// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: mls/message_contents/transcript_messages.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Message content encoding structures

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// A group member and affected installation IDs
public struct Xmtp_Mls_MessageContents_MembershipChange {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var installationIds: [Data] = []

  public var accountAddress: String = String()

  public var initiatedByAccountAddress: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// The group membership change proto
public struct Xmtp_Mls_MessageContents_GroupMembershipChanges {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Members that have been added in the commit
  public var membersAdded: [Xmtp_Mls_MessageContents_MembershipChange] = []

  /// Members that have been removed in the commit
  public var membersRemoved: [Xmtp_Mls_MessageContents_MembershipChange] = []

  /// Installations that have been added in the commit, grouped by member
  public var installationsAdded: [Xmtp_Mls_MessageContents_MembershipChange] = []

  /// Installations removed in the commit, grouped by member
  public var installationsRemoved: [Xmtp_Mls_MessageContents_MembershipChange] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Xmtp_Mls_MessageContents_MembershipChange: @unchecked Sendable {}
extension Xmtp_Mls_MessageContents_GroupMembershipChanges: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "xmtp.mls.message_contents"

extension Xmtp_Mls_MessageContents_MembershipChange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MembershipChange"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "installation_ids"),
    2: .standard(proto: "account_address"),
    3: .standard(proto: "initiated_by_account_address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedBytesField(value: &self.installationIds) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.accountAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.initiatedByAccountAddress) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.installationIds.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.installationIds, fieldNumber: 1)
    }
    if !self.accountAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.accountAddress, fieldNumber: 2)
    }
    if !self.initiatedByAccountAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.initiatedByAccountAddress, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_Mls_MessageContents_MembershipChange, rhs: Xmtp_Mls_MessageContents_MembershipChange) -> Bool {
    if lhs.installationIds != rhs.installationIds {return false}
    if lhs.accountAddress != rhs.accountAddress {return false}
    if lhs.initiatedByAccountAddress != rhs.initiatedByAccountAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Xmtp_Mls_MessageContents_GroupMembershipChanges: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GroupMembershipChanges"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "members_added"),
    2: .standard(proto: "members_removed"),
    3: .standard(proto: "installations_added"),
    4: .standard(proto: "installations_removed"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.membersAdded) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.membersRemoved) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.installationsAdded) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.installationsRemoved) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.membersAdded.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.membersAdded, fieldNumber: 1)
    }
    if !self.membersRemoved.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.membersRemoved, fieldNumber: 2)
    }
    if !self.installationsAdded.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.installationsAdded, fieldNumber: 3)
    }
    if !self.installationsRemoved.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.installationsRemoved, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Xmtp_Mls_MessageContents_GroupMembershipChanges, rhs: Xmtp_Mls_MessageContents_GroupMembershipChanges) -> Bool {
    if lhs.membersAdded != rhs.membersAdded {return false}
    if lhs.membersRemoved != rhs.membersRemoved {return false}
    if lhs.installationsAdded != rhs.installationsAdded {return false}
    if lhs.installationsRemoved != rhs.installationsRemoved {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}