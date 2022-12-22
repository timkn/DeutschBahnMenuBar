//
//  AppDelegate.swift
//  DBMenuBarApp
//
//  Created by Tim Knothe on 22.12.22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quit(_:)), keyEquivalent: ""))
        
        self.statusBarItem.menu = menu
        
        
        if let button = statusBarItem.button {
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
            
            if let data = data, let _ = String(data: data, encoding: .utf8){
                let response: APIResponse  = try! JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.statusBarItem.button?.title = String(response.speed)
                }
            }
        }

        task.resume()
    }
    
    @objc func quit(_ sender: AnyObject?) {
        exit(0)
    }
}

