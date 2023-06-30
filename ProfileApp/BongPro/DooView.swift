
import SwiftUI

struct DooProfile: View {
    var name: String
  var body: some View {
    NavigationStack{
      
      
      List{
        //MARK: - MBTI
        
        NavigationLink {
          List{
            Text("ENTP").font(.largeTitle).bold()
            Text("성격 유형: 변론가").font(.system(size: 30))
              .bold()
            Text(
"""
변론가(ENTP)는 두뇌 회전이 빠르고 대담한 성격으로 현재 상황에 이의를 제기하는 데 거리낌이 없습니다. 변론가는 어떤 의견이나 사람에 반대하는 일을 두려워하지 않으며, 논란이 될 만한 주제에 대해 격렬하게 논쟁하는 일을 즐깁니다.

그렇다고 변론가가 반론을 제기하는 데만 관심이 있거나 악의를 지닌 것은 아닙니다. 사실 변론가는 지식이 풍부하고 호기심이 넘치며 활기찬 유머 감각으로 다른 사람을 즐겁게 할 수 있는 성격입니다. 다만 대부분의 성격과 달리 논쟁에서 즐거움을 찾는 성향이 있을 뿐입니다.
""")
            
            
            Image("MBTI")
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
            Text("경기도 남양주시").font(.system(size: 30))
              .bold()
            Image("Location")
              .imageScale(.large)
          }
        } label: {
          Image(systemName:"location.magnifyingglass" )
            .imageScale(.large)
          Text("지역")
            .font(.largeTitle)
        }
        
        //MARK: - 인사말
        
        NavigationLink {
          Text("안녕하세요. 이 시대 진짜 남자 정한두입니다.")
            .font(.system(size: 30))
            .bold()
        } label: {
          Image(systemName: "theatermask.and.paintbrush.fill")
            .imageScale(.large)
          Text("인사말")
            .font(.largeTitle)
        }
        //MARK: - 좋아하는것
        
        NavigationLink {
          Text("달달한거")
        } label: {
          Image(systemName: "hand.thumbsup")
            .imageScale(.large)
          Text("좋아하는것")
            .font(.largeTitle)
        }
        //MARK: - 싫어하는것
        
        NavigationLink {
          Text("매운거") .font(.system(size: 30))
            .bold()
          Text("집사람과 정반대라 고통입니다.. 오늘저녁은 짬뽕...")
          
        } label: {
          Image(systemName: "hand.thumbsdown")
            .imageScale(.large)
          Text("싫어하는거")
            .font(.largeTitle)
        }
        //MARK: - 대표사진
        
        NavigationLink {
          Image("Doo 2")
            .imageScale(.large)
        } label: {
          Image(systemName: "photo.artframe")
            .imageScale(.large)
          Text("대표사진")
            .font(.largeTitle)
        }
        //MARK: - 애완동물
        
        NavigationLink {
          Text("고양이 3마리~")
            .font(.system(size: 30))
              .bold()
        } label: {
          Image(systemName: "pawprint")
            .imageScale(.large)
          Text("애완동물")
            .font(.largeTitle)
        }
      }
    }
    .navigationTitle("\(name)")
  }
}

struct DooProfile_Previews: PreviewProvider {
  static var previews: some View {
    DooProfile(name: "정한두")
  }
}
