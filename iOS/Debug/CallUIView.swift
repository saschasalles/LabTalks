//
//  CallUIView.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import Foundation
import AVFoundation
import SwiftUI
import UIKit
import WebRTC

struct CallUIView: UIViewControllerRepresentable {
  @Binding var signalingConnected: Bool
  @Binding var hasRemoteSdp: Bool
  @Binding var remoteCandidateCount: Int
  @Binding var localCandidateCount: Int
  @Binding var webRTCStatusColor: UIColor
  let signalingClient: SignalingClient
  let webRTCClient: WebRTCClient


  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  func makeUIViewController(context: Context) -> UIViewController {
    let uiVC = UIViewController()
    self.webRTCClient.delegate = context.coordinator
    self.signalingClient.delegate = context.coordinator
    self.signalingClient.connect()
    return uiVC
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

  class Coordinator: NSObject, WebRTCClientDelegate, SignalClientDelegate {
    var parent: CallUIView


    init(_ parent: CallUIView) {
        self.parent = parent

    }

    func signalClientDidConnect(_ signalClient: SignalingClient) {
      parent.signalingConnected = true
    }

    func signalClientDidDisconnect(_ signalClient: SignalingClient) {
      parent.signalingConnected = false
    }

    func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription) {
      print("Received remote sdp")
      self.parent.webRTCClient.set(remoteSdp: sdp) { (error) in
        self.parent.hasRemoteSdp = true
      }
    }

    func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate) {
      print("Received remote candidate")
      self.parent.remoteCandidateCount += 1
      self.parent.webRTCClient.set(remoteCandidate: candidate)
    }

    func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate) {
      print("discovered local candidate")
      parent.localCandidateCount += 1
      self.parent.signalingClient.send(candidate: candidate)
    }

    func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState) {
      let textColor: UIColor
      switch state {
      case .connected, .completed:
        textColor = .green
      case .disconnected:
        textColor = .orange
      case .failed, .closed:
        textColor = .red
      case .new, .checking, .count:
        textColor = .black
      @unknown default:
        textColor = .black
      }
      DispatchQueue.main.async {
        self.parent.webRTCStatusColor = textColor
      }
    }

    func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data) {
      DispatchQueue.main.async {
        let message = String(data: data, encoding: .utf8) ?? "(Binary: \(data.count) bytes)"
        let alert = UIAlertController(title: "Message from WebRTC", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
      }
    }
  }

}


