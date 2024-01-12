//
//  NewItemViewViewModel.swift
//  SwiftTracker
//
//  Created by Vinamra Kaushal on 24/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UserNotifications

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        //get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        scheduleNotification(for: title, at: dueDate)
        
        //Create a Model
        let newId = UUID().uuidString
        let newItem = SwiftTrackerItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        //Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        //scheduleNotification(for: title, at: dueDate)
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    
    private func scheduleNotification(for task: String, at date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Task Reminder"
        content.body = "Don't forget: \(task)"
        content.sound = UNNotificationSound.default
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully for task: \(task) at \(date)")
            }
        }
    }
}
