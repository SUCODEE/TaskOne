 
import SwiftUI
struct TaskOne: View {
    var title:String
    var ditels:String
    var Laction:() -> Void
    var Raction:() -> Void
    var body: some View {
        HStack{
            VStack(alignment:.leading,spacing:5){
                Text(title).bold().font(.title3)
                Text(ditels).font(.caption2)
            }
            .foregroundStyle(.gray)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .fill(.B)
                    .mask(canvas)
                Buttons
            }
            .padding(.leading, -80)
            .offset(x: 60)
            .frame(width: 80, height: 40)
        }
        .padding(20)
        .background(.R_1,in: .rect(cornerRadius: 30,style: .circular))
        .padding()
    }
    var Buttons:some View{
        Group{
            Image(systemName: "chevron.right")
                .onTapGesture {
                    Laction()
                }
            Image(systemName: "chevron.backward")
                .onTapGesture {
                    Raction()
                }
                .offset(x: -40)
        }
        .font(.callout)
        .foregroundStyle(.black)
    }
    var canvas:some View{
        Canvas{ context , size in
            context.addFilter(.alphaThreshold(min: 0.2))
            context.addFilter(.blur(radius: 8.5))
            context.drawLayer { ctx in
                for index in 1...2{
                    if let symbol = context.resolveSymbol(id: index){
                        ctx.draw(symbol, at: CGPoint(x: size.width / 2, y: size.height / 2))
                    }
                }
            }
        }symbols: {
            Circle()
                .frame(width: 25)
                .tag(1)
            Circle()
                .frame(width: 25)
                .tag(2)
                .offset(x: -40)
        }
    }
}


