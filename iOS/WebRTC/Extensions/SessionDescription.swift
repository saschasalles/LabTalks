//
//  SessionDescription.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import Foundation
import WebRTC

enum SdpType: String, Codable {
  case offer, prAnswer, answer, rollback

  var rtcSdpType: RTCSdpType {
    switch self {
    case .offer: return .offer
    case .answer: return .answer
    case .prAnswer: return .prAnswer
    case .rollback: return .rollback
    }
  }
}


struct SessionDescription: Codable {
  let sdp: String
  let type: SdpType

  init(from rtcSessionDescription: RTCSessionDescription) {
    self.sdp = rtcSessionDescription.sdp

    switch rtcSessionDescription.type {
    case .offer: self.type = .offer
    case .answer: self.type = .answer
    case .prAnswer: self.type = .prAnswer
    case .rollback: self.type = .rollback
    @unknown default:
      fatalError("Unknown RTCSessionDescription type \(rtcSessionDescription.type.rawValue)")
    }
  }

  //Singleton Pattern

  var rtcSessionDescription: RTCSessionDescription {
    return RTCSessionDescription(type: self.type.rtcSdpType, sdp: self.sdp)
  }
}
