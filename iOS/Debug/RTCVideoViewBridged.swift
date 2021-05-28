//
//  Adaptors.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import Foundation
import UIKit
import SwiftUI
import WebRTC


struct RTCMTLVideoViewBridged: UIViewRepresentable {
  var frame: CGRect


  func makeCoordinator() -> Coordinator {
    // todo
  }

  func makeUIView(context: Context) -> RTCMTLVideoView {
    let videoView = RTCMTLVideoView(frame: frame)
    videoView.videoContentMode = .scaleAspectFill
    return videoView
    
  }

  func updateUIView(_ uiView: RTCMTLVideoView, context: Context) {
  }
}

struct RTCOpenGLVideoViewBridged: UIViewRepresentable {
  var frame: CGRect

  func makeCoordinator() -> Coordinator {
    // todo
  }

  func makeUIView(context: Context) -> RTCEAGLVideoView {
    let videoView = RTCEAGLVideoView(frame: frame)
    return videoView
  }

  func updateUIView(_ uiView: RTCEAGLVideoView, context: Context) {
  }
}



