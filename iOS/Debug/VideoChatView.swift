//
//  VideoChatView.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import Foundation
import SwiftUI



struct VideoChatView: View {
  private let webRTCClient: WebRTCClient
  private var localRenderer: (RTCMTLVideoViewBridged, RTCOpenGLVideoViewBridged)
  private var remoteRenderer: (RTCMTLVideoViewBridged, RTCOpenGLVideoViewBridged)

  init(webRTCClient: WebRTCClient) {
    self.webRTCClient = webRTCClient
    self.localRenderer = (
      RTCMTLVideoViewBridged(frame:
        CGRect(x: 0,
               y: 0,
               width: 100,
               height: 100)),
      RTCOpenGLVideoViewBridged(frame:
        CGRect(x: 0,
               y: 0,
               width: 100,
               height: 100)))
    self.remoteRenderer = (
      RTCMTLVideoViewBridged(frame:
        CGRect(x: 0,
               y: 0,
               width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)),
      RTCOpenGLVideoViewBridged(frame:
        CGRect(x: 0,
               y: 0,
               width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)))
  }

  var body: some View {
    VStack {
      #if arch(arm64)
        ZStack {
          remoteRenderer.0
          localRenderer.0
        }

      #else
      ZStack {
        remoteRenderer.1
        localRenderer.1
      }
      #endif
    }
  }


}
