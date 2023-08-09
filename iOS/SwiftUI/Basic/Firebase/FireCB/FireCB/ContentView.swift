//
//  ContentView.swift
//  FireCB
//
//  Created by LJh on 2023/08/09.
//

import SwiftUI
import GoogleSignInSwift
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct ContentView: View {
  @State var isMessage : Bool = false
  @State var message : String = ""
  @State var loginMessage : Bool = false
 
  var body: some View {
    VStack {
      Text("\(message)")
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      
      GoogleSignInButton {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        //구글 인증 토큰을 받아온곳

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.windows.first!.rootViewController!) { result, error in
          guard error == nil else {
            print("\(error?.localizedDescription ?? "옵셔널")")
            return
          }
          
          guard let user = result?.user,
                let idToken = user.idToken?.tokenString
          else {
            print("\(error?.localizedDescription ?? "옵셔널")")
            return
          }
          
          let credential = GoogleAuthProvider.credential(withIDToken: idToken,accessToken: user.accessToken.tokenString)
          
          // 사용자정보토큰을 만드는곳 credential은 즉 사용자인증토큰이다.
          
          
          //파베 인증하러 가는 코드
          Auth.auth().signIn(with: credential) { result, error in
            isMessage.toggle()
            message = Auth.auth().currentUser?.email ?? "유빈님"
            // At this point, our user is signed in
          }
          
        }
 
      }// : 다른뷰
      .alert(isPresented: $isMessage) {
        Alert(title: Text("축하"), message: Text("\(message)"), dismissButton: .default(Text("싫어")))
      }
      Button {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
          loginMessage.toggle()
          message = ""
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
      } label: {
        Text(loginMessage ? "로그인" : "로그아웃")
      }
      
      
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
