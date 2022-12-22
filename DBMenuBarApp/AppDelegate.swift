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
        
        
        
        
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "s.circle", accessibilityDescription: "s")
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (t) in
            self.apiCall()
        }
        
    }
    
    
    func apiCall() {
        guard let url = URL(string: "https://iceportal.de/api1/rs/status") else {
            return
        }


        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                let response: APIResponse  = try! JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.statusItem.button?.title = String(response.speed)
                }
            }
        }

        task.resume()
    }
}

