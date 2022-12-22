//
//  AppDelegate.swift
//  DBMenuBarApp
//
//  Created by Tim Knothe on 22.12.22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        apiCall()
        
        
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")
        }
    }
    
    
    func apiCall() {
        
        guard let url = URL(string: "https://iceportal.de/api1/rs/status") else {
            return
        }


        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                print(string)
            }
        }

        task.resume()
    }
}

