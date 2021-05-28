//
//  IceCandidate.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import Foundation
import WebRTC


struct IceCandidate: Codable {
  let sdp: String
  let sdpMLineIndex: Int32
  let sdpMid: String?

  init(from iceCandidate: RTCIceCandidate) {
    self.sdpMLineIndex = iceCandidate.sdpMLineIndex
    self.sdpMid = iceCandidate.sdpMid
    self.sdp = iceCandidate.sdp
  }

  // Singleton pattern
  var rtcIceCandidate: RTCIceCandidate {
    return RTCIceCandidate(sdp: self.sdp, sdpMLineIndex: self.sdpMLineIndex, sdpMid: self.sdpMid)
  }
}
