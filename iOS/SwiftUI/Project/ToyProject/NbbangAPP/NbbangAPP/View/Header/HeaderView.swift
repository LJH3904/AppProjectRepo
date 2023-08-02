//
//  HeaderView.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct HeaderView: View {
  @ObservedObject var moneyStore : MoneyStore = MoneyStore()
  var title : String = "더치페이할 금액"
  @State var moneyTextfield : String = ""
  var body: some View {
    ZStack{
      
      HStack {
        Spacer()
        VStack(alignment: .leading) {
          Text("\(title)")
            .fontWeight(.black)
            .font(.system(size: 30))
            .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
          TextField("금액을 입력하시오", text: $moneyTextfield)
          Text("\(moneyStore.showingMoney)")
        }.padding()
        Button {
          moneyStore.divideMoneyToTen(money: moneyTextfield)
        } label: {
          ButtonDesignView()
        }

        
          .padding()
        Spacer()
      }
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
