//
//  MonsterStore.swift
//  Homework
//
//  Created by LJh on 2023/07/17.
//

import Foundation


class MonsterStore : ObservableObject{
  @Published var monsterStore : [Monster]  = []
  @Published var choiceMonster : [Monster] = []
  
  init(){
    //MARK: - 질문

    monsterStore = [
                     Monster(name: "레비아탄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/a4bf3fa6dbf2d24f12d1e67a589fdf9d.jpg"),
                     Monster(name: "모사사우르스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e252e4da030f1573dd53e1ce0e40f1f9.jpg"),
                     Monster(name: "크라켄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e33011ac0f13211860c001c9e1740dcf.jpg"),
                     Monster(name: "메갈로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/644531506cfe4ab831955ba3fe659b0f.jpg"),
                     Monster(name: "노토사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/74cf5cd1b96b0749cccd90b48e779987.jpg"),
                     Monster(name: "바실로사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/002fd4fa8638b315a24ee0ddb236993e.jpg"),
                     Monster(name: "카메로세라스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/dd1fa4aeac7d20845163bd46e87fbe0c.jpg"),
                     Monster(name: "시 서펜트", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/d1426f35c300cb75fc48006e4417896f.jpg"),
                     Monster(name: "던클리오스테우스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/8bfe233494c0951335059f9d18487b86.jpg"),
                     Monster(name: "플레시오플레우로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/0023c6dcf7fd26a3e11c2ed6ad6b3dea.jpg"),
                     Monster(name: "크라켄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e33011ac0f13211860c001c9e1740dcf.jpg"),
                     Monster(name: "메갈로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/644531506cfe4ab831955ba3fe659b0f.jpg"),
                     Monster(name: "노토사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/74cf5cd1b96b0749cccd90b48e779987.jpg"),
                     Monster(name: "바실로사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/002fd4fa8638b315a24ee0ddb236993e.jpg"),
                     Monster(name: "카메로세라스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/dd1fa4aeac7d20845163bd46e87fbe0c.jpg"),
                     Monster(name: "시 서펜트", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/d1426f35c300cb75fc48006e4417896f.jpg"),
                     Monster(name: "던클리오스테우스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/8bfe233494c0951335059f9d18487b86.jpg"),
                     Monster(name: "플레시오플레우로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/0023c6dcf7fd26a3e11c2ed6ad6b3dea.jpg"),
                     Monster(name: "레비아탄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/a4bf3fa6dbf2d24f12d1e67a589fdf9d.jpg"),
                     Monster(name: "모사사우르스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e252e4da030f1573dd53e1ce0e40f1f9.jpg"),
                     Monster(name: "크라켄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e33011ac0f13211860c001c9e1740dcf.jpg"),
                     Monster(name: "메갈로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/644531506cfe4ab831955ba3fe659b0f.jpg"),
                     Monster(name: "노토사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/74cf5cd1b96b0749cccd90b48e779987.jpg"),
                     Monster(name: "바실로사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/002fd4fa8638b315a24ee0ddb236993e.jpg"),
                     Monster(name: "카메로세라스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/dd1fa4aeac7d20845163bd46e87fbe0c.jpg"),
                     Monster(name: "시 서펜트", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/d1426f35c300cb75fc48006e4417896f.jpg"),
                     Monster(name: "던클리오스테우스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/8bfe233494c0951335059f9d18487b86.jpg"),
                     Monster(name: "플레시오플레우로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/0023c6dcf7fd26a3e11c2ed6ad6b3dea.jpg"),
                     Monster(name: "크라켄", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/e33011ac0f13211860c001c9e1740dcf.jpg"),
                     Monster(name: "메갈로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/644531506cfe4ab831955ba3fe659b0f.jpg"),
                     Monster(name: "노토사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/74cf5cd1b96b0749cccd90b48e779987.jpg"),
                     Monster(name: "바실로사우루스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/002fd4fa8638b315a24ee0ddb236993e.jpg"),
                     Monster(name: "카메로세라스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/dd1fa4aeac7d20845163bd46e87fbe0c.jpg"),
                     Monster(name: "시 서펜트", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/d1426f35c300cb75fc48006e4417896f.jpg"),
                     Monster(name: "던클리오스테우스", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/8bfe233494c0951335059f9d18487b86.jpg"),
                     Monster(name: "플레시오플레우로돈", locationURLString: "https://img.daily.co.kr/@files/www.daily.co.kr/content_watermark/life/2019/20191212/0023c6dcf7fd26a3e11c2ed6ad6b3dea.jpg")
    ]
    
  }
  
  func addMonster(monster : Monster){
    choiceMonster.append(monster)
  }
  func insertAll(){
    choiceMonster  = monsterStore
  }
  func resetMonster(){
    choiceMonster.removeAll()
  }
  func deleteMonster(monster : Monster){
    choiceMonster.removeAll(where: { $0.id == monster.id })
    
  }

  func shuffled(){
    choiceMonster.shuffle()
  }
}
