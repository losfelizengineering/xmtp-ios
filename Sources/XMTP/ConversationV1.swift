//
//  ConversationV1.swift
//
//
//  Created by Pat Nakajima on 11/28/22.
//

import Foundation

public struct ConversationV1 {
	var client: Client
	var peerAddress: String
	var sentAt: Date

	var topic: Topic {
		Topic.directMessageV1(client.address, peerAddress)
	}

	func send(content: String, options _: SendOptions? = nil) async throws {
		guard let contact = try await client.contacts.find(peerAddress) else {
			throw ContactBundleError.notFound
		}

		let encoder = TextCodec()
		let encodedContent = try encoder.encode(content: content)
		let recipient = try contact.toPublicKeyBundle()

		if !recipient.identityKey.hasSignature {
			fatalError("no signature for id key")
		}

		let message = try MessageV1.encode(
			sender: client.privateKeyBundleV1,
			recipient: recipient,
			message: try encodedContent.serializedData(),
			timestamp: Date()
		)

		let date = Date()

		var envelopes = [
			Envelope(
				topic: .directMessageV1(client.address, peerAddress),
				timestamp: date,
				message: try Message(v1: message).serializedData()
			),
		]

		if client.contacts.needsIntroduction(peerAddress) {
			envelopes.append(contentsOf: [
				Envelope(
					topic: .userIntro(peerAddress),
					timestamp: date,
					message: try Message(v1: message).serializedData()
				),
				Envelope(
					topic: .userIntro(client.address),
					timestamp: date,
					message: try Message(v1: message).serializedData()
				),
			])

			client.contacts.hasIntroduced[peerAddress] = true
		}

		try await client.publish(envelopes: envelopes)
	}

	public func streamMessages() -> AsyncThrowingStream<DecodedMessage, Error> {
		AsyncThrowingStream { continuation in
			Task {
				for try await envelope in client.subscribe(topics: [topic.description]) {
					let decoded = try decode(envelope: envelope)
					continuation.yield(decoded)
				}
			}
		}
	}

	func messages() async throws -> [DecodedMessage] {
		let envelopes = try await client.apiClient.query(topics: [
			.directMessageV1(client.address, peerAddress),
		]).envelopes

		return envelopes.compactMap { envelope in
			do {
				return try decode(envelope: envelope)
			} catch {
				print("ERROR DECODING CONVO V1 MESSAGE: \(error)")
				return nil
			}
		}
	}

	private func decode(envelope: Envelope) throws -> DecodedMessage {
		let message = try Message(serializedData: envelope.message)
		let decrypted = try message.v1.decrypt(with: client.privateKeyBundleV1)

		let encodedMessage = try EncodedContent(serializedData: decrypted)
		let decoder = TextCodec()
		let decoded = try decoder.decode(content: encodedMessage)

		let header = try message.v1.header

		return DecodedMessage(
			body: decoded,
			senderAddress: header.sender.walletAddress,
			sent: message.v1.sentAt
		)
	}
}