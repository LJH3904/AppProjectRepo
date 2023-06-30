import SwiftUI

struct MemberView: View {
  
  var member: Member
  var body: some View {
    
    NavigationStack{
      List{
        //MARK: - MBTI
        
        NavigationLink {
          List{
            Text("\(member.mbti)").font(.largeTitle).bold()
            Text("\(member.mbtiDescription)").font(.system(size: 30)).bold()
          }
        } label: {
          
          Image(systemName: "person.text.rectangle")
            .imageScale(.large)
          Text("MBTI")
            .font(.largeTitle)
          
        }
        
        //MARK: - 지역
        
        NavigationLink {
          List{
            AsyncImage(url: member.locationURL) { image in
              image
                .resizable()
                .aspectRatio(contentMode: .fill)
              //                    .frame(width: 100, height: 100)
                .clipShape(Circle())
            } placeholder: {
              ProgressView()
            }
          }
        }label: {
          Image(systemName:"location.magnifyingglass" )
            .imageScale(.large)
          Text("지역")
            .font(.largeTitle)
        }
        
        
        //MARK: - 좋아하는것
        
        NavigationLink {
          Text("\(member.like)")
        } label: {
          Image(systemName: "hand.thumbsup")
            .imageScale(.large)
          Text("좋아하는것")
            .font(.largeTitle)
        }
        //MARK: - 싫어하는것
        
        NavigationLink {
          Text("\(member.hate)") .font(.system(size: 30))
            .bold()
        } label: {
          Image(systemName: "hand.thumbsdown")
            .imageScale(.large)
          Text("싫어하는거")
            .font(.largeTitle)
        }
        
        //MARK: - 애완동물
        
        NavigationLink {
          Text("\(member.pet)")
            .font(.system(size: 30))
            .bold()
        } label: {
          Image(systemName: "pawprint")
            .imageScale(.large)
          Text("애완동물")
            .font(.largeTitle)
        }
      }.navigationTitle("\(member.name)")
    }
    
  }
}

struct LjhProfile_Previews: PreviewProvider {
  static var previews: some View {
    MemberView(member: Member.init(name: "이제현", mbti: "INTP", mbtiDescription: "논리술사",locationURLString: "https://www.google.co.kr/maps/place/%ED%99%94%EA%B3%A1%EC%97%AD/data=!3m8!1e2!3m6!1sAF1QipMsqfdxHvva_ka0buDWtG9qvxyS3SRfPcg5XkvO!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMsqfdxHvva_ka0buDWtG9qvxyS3SRfPcg5XkvO%3Dw203-h270-k-no!7i3024!8i4032!4m11!1m2!2m1!1z7ZmU6rOh7Jet!3m7!1s0x357c9c4f460c32b7:0x68979fc65f1d6963!8m2!3d37.541578!4d126.840436!10e5!15sCgntmZTqs6Hsl62SARdsb2dpY2FsX3RyYW5zaXRfc3RhdGlvbuABAA!16s%2Fm%2F03grkwm?hl=ko&entry=ttu#", like: "게임", hate: "팝콘,가지", pet: "X"))
  }
}
