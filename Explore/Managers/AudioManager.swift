//
//  AudioManager.swift
//  Explore
//
//  Created by Christian Graver on 20/01/2019.
//  Copyright © 2019 nordgrus. All rights reserved.
//

import Foundation
import AVFoundation

struct AudioManager {
    static func setup() {
        let sess = AVAudioSession.sharedInstance()
        try? sess.setCategory(.playback, mode:.spokenAudio)
        try? sess.setActive(false)
        let opts = sess.categoryOptions.union([.interruptSpokenAudioAndMixWithOthers, .duckOthers])
        try? sess.setCategory(sess.category, mode: sess.mode, options: opts)
        try? sess.setActive(false)
    }
    
    static func set(active: Bool) {
        let sess = AVAudioSession.sharedInstance()
        if active {
          try? sess.setActive(true)
        } else {
            try? sess.setActive(false, options: .notifyOthersOnDeactivation)
        }
        
    }
}
