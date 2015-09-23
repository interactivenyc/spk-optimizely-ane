# spk-optimizely-ane
Optimizely Native Extension for Adobe AIR / Actionscript

To build these files you need to have Adobe AIR SDK, Apache Flex SDK and ANT installed.

1) Edit the file SPK-Optimizely_Build/build.config with paths to your AIR and Flex SDKs

2) Open the file: SPK-Optimizely_IOS/OptimizelyANE/OptimizelyANE.xcworkspace

3) Connect to a device, and publish the Pods and OptimizelyANE targets so the .a files wind up in SPK-Optimizely_IOS/OptimizelyANE/Build/Products/Debug-iphoneos (this location required by the ANT build script)

4) In a Terminal window, cd to SPK-Optimizely_Build and run "ant buildOptimizely"

5) run "ant testOptimizely" for an Android Test Build or "ant testOptimizelyIOS" for IOS

Please let me know if you have any trouble with these instructions, and I will elaborate if necessary.


