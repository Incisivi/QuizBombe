//
//  SettingsView.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//


import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext // main ModelContext
    @Query private var userInfo: [UserModel] // whereever this information is needed , go get it
    
    @State private var userName: String = ""
    @State private var userAge: String = ""
    @State private var userBirthday: String = ""
    @State private var userAddress: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Age", text: $userAge)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Birthday", text: $userBirthday)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Address", text: $userAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $userPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                insertUserData()
            }) {
                Text("Speichern")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            Text("Benutzernamen:")
            ForEach(userInfo, id: \.id) { user in
                Text(user.name)
            }
        }
        .padding()
    }
    
    private func insertUserData() {
        // löscht die alten nutzerdaten // for better storage
        for user in userInfo {
            modelContext.delete(user)
        }
        // created neuen user mit eingegebenen daten // achtung alles muss neu eingetragen werden
        let newUser = UserModel(
            id: UUID().uuidString,
            name: userName,
            age: userAge,
            birthday: userBirthday,
            adress: userAddress,
            password: userPassword)
        
        // fügt user dem modelContainer hinzu
        modelContext.insert(newUser)
        
        do {
            
            // speichert hier erst den user!
            try modelContext.save()
            
            // cleared die eingabefelder
            userName = ""
            userAge = ""
            userBirthday = ""
            userAddress = ""
            userPassword = ""
            // do/catch
        } catch {
            print("Fehler beim Speichern: \(error)")
        }
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: UserModel.self)
}//
