test:
	xcodebuild -project XP.xcodeproj -scheme XP -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 13,OS=15.0' clean test