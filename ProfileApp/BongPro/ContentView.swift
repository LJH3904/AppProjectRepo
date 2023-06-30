import SwiftUI


struct ContentView: View {
    //let members : Member
    var body: some View {
        NavigationStack{
            
            
            List{
                ForEach(team5.members) { member in
                    
                    NavigationLink{
                        MemberView(member: member)
                    }label: {
                        Text("\(member.name)")
                    }
                    
                }
            }.navigationTitle("Team5")
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
