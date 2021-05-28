//
//  CallView.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 27/05/2021.
//

import SwiftUI
import AVFoundation
import WebRTC

struct CallView: View {
  @State var signalingConnected = false
  @State var hasLocalSdp = false
  @State var hasRemoteSdp = false
  @State var localCandidateCount = 0
  @State var remoteCandidateCount = 0
  @State var speakerOn = false
  @State var mute = false
  @State var webRTCStatusColor = UIColor.black
  @ObservedObject var webRTCClient: WebRTCClient
  @ObservedObject var signalingClient: SignalingClient

  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Signaling status: \(signalingConnected ? "Connected ✅" : "Not Connected ❌")")
        .foregroundColor(signalingConnected ? .green : .red)
      Text("Local sdp: \(hasLocalSdp ? "Connected ✅" : "Not Connected ❌")")
      Text("Remote sdp: \(hasRemoteSdp ? "Connected ✅" : "Not Connected ❌")")
      Text("Local candidate count \(localCandidateCount)")
      Text("Remote candidate count \(remoteCandidateCount)")

      HStack(spacing: 15) {
        Button {
          self.webRTCClient.offer { (sdp) in
            self.hasLocalSdp = true
            self.signalingClient.send(sdp: sdp)
          }
        } label: {
          Text("Send Offer")
        }

        Button {
          self.webRTCClient.answer { (localSdp) in
            self.hasLocalSdp = true
            self.signalingClient.send(sdp: localSdp)
          }
        } label: {
          Text("Send Answer")
        }
      }

      HStack(spacing: 15) {
        Button {
          self.mute = !self.mute
          if self.mute {
            self.webRTCClient.muteAudio()
          }
          else {
            self.webRTCClient.unmuteAudio()
          }
        } label: {
          Text("Mute")
        }

        Button {
          if self.speakerOn {
            self.webRTCClient.speakerOff()
          }
          else {
            self.webRTCClient.speakerOn()
          }
          self.speakerOn = !self.speakerOn
        } label: {
          Text("Speaker")
        }

      }


      HStack(spacing: 15) {
        Button {
          print("video")
        } label: {
          Text("Video")
        }

        Button {
          print("data")
        } label: {
          Text("Send Data")
        }

      }
      

      CallUIView(signalingConnected: $signalingConnected, hasRemoteSdp: $hasRemoteSdp, remoteCandidateCount: $remoteCandidateCount, localCandidateCount: $localCandidateCount, webRTCStatusColor: $webRTCStatusColor, signalingClient: signalingClient, webRTCClient: webRTCClient)

    }.padding()
  }
}


