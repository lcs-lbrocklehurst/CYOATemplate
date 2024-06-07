//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import NVMColor
import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    @State private var backgroundColor = Color.white
    
    // MARK: Computed properties
    
    var hexRepresentation: String {
        return String(backgroundColor.hex?.isHex()?.dropLast(2) ?? "FFFFFF")
    }
    
    var body: some View {
        
        // Make the connection to the book state a two-way binding
        // (By default when accessing through environment it is read-only)
        @Bindable var book = book
        
        // The user interface
        return NavigationStack {
            
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                VStack {
                    Toggle(isOn: $book.reader.prefersDarkMode) {
                        Label {
                            Text("Dark Mode")
                        } icon: {
                            Image(systemName: "moonphase.first.quarter")
                        }
                    }
                    
                    Spacer()
                    ColorPicker("Set the background color", selection: $backgroundColor)
                }
                
            }
            .padding()
            .navigationTitle("Statistics")
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Hide this view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showing = false
                    } label: {
                        Text("Done")
                            .bold()
                    }
                    
                }
            }
            .onChange(of: backgroundColor) {
                // This code runs whenever background color changes
                dump(book.reader)
                book.reader.backgroundColor = hexRepresentation
                dump(book.reader)
            }
            
        }
        
    }
}

#Preview {
    SettingsView(showing: Binding.constant(true))
}
