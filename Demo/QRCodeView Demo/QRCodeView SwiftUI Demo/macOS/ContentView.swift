//
//  ContentView.swift
//  Shared
//
//  Created by Darren Ford on 8/11/21.
//

import SwiftUI
import QRCode

struct ContentView: View {

	@State var content: String = "This is a test of the QR code control"
	@State var correction: QRCode.ErrorCorrection = .low

	@State var dataColor: Color = .primary
	@State var eyeColor: Color = .primary
	@State var pupilColor: Color = .primary
	@State var backgroundColor: Color = .clear

	@State var dataShape: DataShapeType = .square
	@State var eyeStyle: EyeShapeType = .square

	var body: some View {

		let qrContent = QRCodeUI(
			data: content.data(using: .utf8) ?? Data(),
			errorCorrection: correction
		)
		
		let dataShape = dataShapeHandler(self.dataShape)
		let eyeStyle = eyeShapeHandler(self.eyeStyle)

		HSplitView {
			VStack {
				HStack {
					Text("Content")
					TextField("Text", text: $content)
				}
				Picker(selection: $correction, label: Text("Error correction:")) {
					Text("Low (L)").tag(QRCode.ErrorCorrection.low)
					Text("Medium (M)").tag(QRCode.ErrorCorrection.medium)
					Text("High (Q)").tag(QRCode.ErrorCorrection.high)
					Text("Max (H)").tag(QRCode.ErrorCorrection.max)
				}.pickerStyle(RadioGroupPickerStyle())
				Picker(selection: $dataShape, label: Text("Data Shape:")) {
					Text("Square").tag(DataShapeType.square)
					Text("Round Rect").tag(DataShapeType.roundedrect)
					Text("Circle").tag(DataShapeType.circle)
					Text("Horizontal").tag(DataShapeType.horizontal)
					Text("Vertical").tag(DataShapeType.vertical)
					Text("Rounded Path").tag(DataShapeType.roundedpath)
				}.pickerStyle(RadioGroupPickerStyle())
				Picker(selection: $eyeStyle, label: Text("Eye Shape:")) {
					Text("Square").tag(EyeShapeType.square)
					Text("Round Rect").tag(EyeShapeType.roundedRect)
					Text("Circle").tag(EyeShapeType.circle)
					Text("Leaf").tag(EyeShapeType.leaf)
					Text("Rounded Outer").tag(EyeShapeType.roundedOuter)
					Text("Rounded Pointing In").tag(EyeShapeType.roundedPointingIn)
					Text("Squircle").tag(EyeShapeType.squircle)
				}.pickerStyle(RadioGroupPickerStyle())
				HStack {
					ColorPicker("Data Color", selection: $dataColor)
					ColorPicker("Background", selection: $backgroundColor)
				}
				HStack {
					ColorPicker("Eye Color", selection: $eyeColor)
					ColorPicker("Pupil Color", selection: $pupilColor)
				}

				Spacer()
			}
			.frame(alignment: .top)
			.padding()

			ZStack {
				backgroundColor
				qrContent
					.components(.eyeOuter)
					.eyeShape(eyeStyle)
					.fill(eyeColor)
				qrContent
					.components(.eyePupil)
					.eyeShape(eyeStyle)
					.fill(pupilColor)
				qrContent
					.components(.onPixels)
					.dataShape(dataShape)
					.fill(dataColor)
//				qrContent
//					.components(.unsetContent)
//					.dataShape(dataShape)
//					.fill(.gray.opacity(0.2))
			}
			.frame(alignment: .center)
			.padding()

		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
