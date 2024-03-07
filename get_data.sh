docker create --name tempqt6 qt6build
mkdir qt6_binaries
docker cp tempqt6:/workspace/qt-everywhere-src-6.6.1/build qt6_binaries
