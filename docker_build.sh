docker build -t qt6build .
docker create --name tempqt6 qt6build
mkdir qt6_binaries
docker cp tempqt6:/usr/local/qt6 qt6_binaries
