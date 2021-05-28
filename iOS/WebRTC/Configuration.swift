import Foundation

fileprivate let defaultSignalingServerUrl = URL(string: "ws://51.178.30.122:8080")!

fileprivate let defaultIceServers = ["stun:stun.l.google.com:19302",
                                     "stun:stun1.l.google.com:19302",
                                     "stun:stun2.l.google.com:19302",
                                     "stun:stun3.l.google.com:19302",
                                     "stun:stun4.l.google.com:19302"]
struct Configuration {
  let signalingServerUrl: URL
  let webRTCIceServers: [String]

  static let `default` = Configuration(signalingServerUrl: defaultSignalingServerUrl, webRTCIceServers: defaultIceServers)
}
