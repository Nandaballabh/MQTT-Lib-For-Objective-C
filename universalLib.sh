# Remove old file
 rm libmosquitto.a
 rm -rf Build
Build the project
echo "Building mosquitto-1.4.12..."
xcodebuild clean
xcodebuild -project Mosquitto.xcodeproj -scheme mosquitto -sdk iphonesimulator9.3 -configuration Release -verbose
xcodebuild -project Mosquitto.xcodeproj -scheme mosquitto -sdk iphoneos9.3 -configuration Release -verbose
# combine lib files for various platforms into one
echo "combining lib files for various platforms into one..."
lipo -create ./Build/Products/Release/Release-iphonesimulator/libmosquitto.a ./Build/Products/Release/Release-iphoneos/libmosquitto.a -output ./libmosquitto.a
lipo -info libmosquitto.a
echo "***************************"

