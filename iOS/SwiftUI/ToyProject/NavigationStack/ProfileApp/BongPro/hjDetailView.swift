
import SwiftUI

struct hjDetailView: View {
    var name: String
    
    private let url: String = "https://www.logoyogo.com/downloads/호랑이-얼굴-아이콘-일러스트-ai-다운로드/"
    
    struct profile{
        var myMbti : String
        var myArea : String
        var hello : String
        var myLike : String
        var myHate : String
        //var photo : Image
        var my : String
        
        init(){
            self.myMbti  = "ESTP"
            self.myArea = "서울시 양천구ㅎㅎ"
            self.hello = "일주일동안 화이팅..ㅎㅎ"
            self.myLike = "맛집탐방"
            self.myHate = "가지.."
            //self.photo = Image("IMG_2589 2")
            self.my = "애완동물 읎음..!\n(햄스터랑 물고기는 키운 적 🙆‍♀️"
        }
    }
    
    var hyeonjeong : profile = profile()
    
    var body: some View {
        
        NavigationStack{
            
            
            List{
                //MARK: - MBTI
                
                NavigationLink {
                    List{
                        Text(hyeonjeong.myMbti).font(.largeTitle).bold()
                        Text("성격 유형: 사업가").font(.system(size: 30))
                            .bold()
                        Text(
    """
    사업가(ESTP)는 항상 주변 사람에게 영향력을 행사하곤 합니다. 파티에서 가는 곳마다 사람들에게 둘러싸여 있는 사람을 발견한다면 아마 사업가일 것입니다. 이들은 직설적인 유머 감각을 지니고 있으며 수많은 사람의 관심을 받는 일을 즐깁니다. 한 마디로 사회자가 무대로 올라올 사람을 찾을 때 직접 무대로 올라가는 성격이라고 할 수 있습니다.
    
    사업가는 이론적이고 추상적인 개념과 지루한 토론에는 관심이 없습니다. 지능이 높고 활기찬 대화를 유지할 수 있는 성격이기는 하지만 현실적인 주제에 대해 이야기하고 직접 행동하는 성격이기 때문입니다. 이들은 계획을 심사숙고하기보다는 먼저 행동하고 시행착오를 겪으며 실수를 바로잡기를 원합니다.
    """)
                        
                        
                        //Image("MBTI")
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
                        Text(hyeonjeong.myArea).font(.system(size: 30))
                            .bold()
                        //                                            Image("Location")
                        //                                              .imageScale(.large)
                    }
                } label: {
                    Image(systemName:"location.magnifyingglass" )
                        .imageScale(.large)
                    Text("지역")
                        .font(.largeTitle)
                }
                
                //MARK: - 인사말
                
                NavigationLink {
                    Text(hyeonjeong.hello)
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
                    Text(hyeonjeong.myLike)
                        .font(.system(size: 30))
                        .bold()
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .imageScale(.large)
                    Text("좋아하는것")
                        .font(.largeTitle)
                }
                //MARK: - 싫어하는것
                
                NavigationLink {
                    Text(hyeonjeong.myHate) .font(.system(size: 30))
                        .bold()
                    
                } label: {
                    Image(systemName: "hand.thumbsdown")
                        .imageScale(.large)
                    Text("싫어하는거")
                        .font(.largeTitle)
                }
                //MARK: - 대표사진
                
                NavigationLink {
                    
                    AsyncImage(url: URL(string: url), scale: 150.0)
//                        .frame(maxWidth: 300, maxHeight: 100)
                    
                } label: {
                    
                    Text("대표사진")
                        .font(.largeTitle)
                }
                //MARK: - 애완동물
                
                NavigationLink {
                    Text(hyeonjeong.my)
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

struct hjDetailView_Previews: PreviewProvider {
    static var previews: some View {
        hjDetailView(name: "남현정")
    }
}
