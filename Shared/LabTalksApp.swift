//
//  LabTalksApp.swift
//  Shared
//
//  Created by Sascha Sallès on 12/02/2021.
//

import SwiftUI
import UIKit



@main
struct LabTalksApp: App {
  private var webRTCClient: WebRTCClient = WebRTCClient(iceServers: Configuration.default.webRTCIceServers)

  public func buildSignalingClient() -> SignalingClient {
    let webSocketProvider: WebSocketProvider

    if #available(iOS 13.0, *) {
      webSocketProvider = NativeWebSocket(url: Configuration.default.signalingServerUrl)
    } else {
      webSocketProvider = StarscreamWebSocket(url: Configuration.default.signalingServerUrl)
    }

    return SignalingClient(webSocket: webSocketProvider)
  }

  let persistenceController = PersistenceController.shared
  @State private var isWelcomePresented = true
  var body: some Scene {
    WindowGroup {
      if self.isWelcomePresented {
        WelcomeView(isWelcomePresented: self.$isWelcomePresented)
      } else {
        ContentView(webRTClient: webRTCClient, signalingClient: buildSignalingClient())
          .environment(\.managedObjectContext, persistenceController.container.viewContext)

      }
    }
  }
}
