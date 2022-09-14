import SwiftUI

struct CalculatorView: View {
    var body: some View {

        VStack {
            // Display
            Text("0")
            // Buttons
            VStack {
                ForEach(viewModel.buttons, ) {
                    row in HStack {
                        ForEach (row, id: \.self) {
                            button in Button(button) {
                                viewModel.performAction(for: button)
                            }
                        }
                    }
                } 
            }
        }


    }
}

struct CalculatorView_Previews:
    PreviewProvider {
        static var previews: some View {
            CaculatorView()
                .environmentObject(CalculatorView.ViewModel())
                .previewInterfaceOrientation(.portrait)
        }
    }