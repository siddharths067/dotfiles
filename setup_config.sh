set -e
set -x
echo "Stowing Neovim configuration"
stow  -t $HOME/.config --dotfiles config -vv

# Download and build java-debug jar

echo "Downloading and building java-debug plugin"
echo "\t Changing into /tmp folder to build java-debug"
pushd /tmp
echo "\t Removing existing java-debug folder"
rm -rf java-debug
echo "\t Cloning java-debug"
git clone https://github.com/microsoft/java-debug.git
pushd java-debug
echo "\t Building java-debug"
./mvnw clean install
echo "\t Copying java-debug build"
ls | grep ".*.jar" | xargs -I java_debug_jar_file cp -f java_debug_jar_file $HOME/.config/nvim/resources/java_debug_jar_file -v
popd
echo "\t Deleting the java-debug repo from tmp folder"
rm -rf java-debug
echo "\t Getting out of /tmp folder"
popd
echo "java-debug successfully installed"





echo "Downloading and building vscode-java-test plugin"
echo "\t Changing into /tmp folder to build vscode-java-test"
pushd /tmp
echo "\t Removing existing vscode-java-test folder"
rm -rf vscode-java-test
echo "\t Cloning vscode-java-test"
git clone https://github.com/microsoft/vscode-java-test.git
pushd vscode-java-test
echo "\t Building vscode-java-test"
npm install
npm run build-plugin


echo "\t Changing into server build directories"
pushd server
echo "\t Copying vscode-java-test build"
ls | grep -v "jacocoagent.jar" | grep -v "com.microsoft.java.test.runner-jar-with-dependencies.jar" | xargs -I jar_file cp -f jar_file $HOME/.config/nvim/resources/$jar_file -v
echo "\t get out of server build directory"
popd

echo "\t Changing into plugins directory to copy ASM binaries"
pushd java-extension/com.microsoft.java.test.plugin.site/target/repository/plugins 
ls | grep "objectweb" | xargs -I jar_file cp -f jar_file $HOME/.config/nvim/resources/$jar_file -v
popd

popd
echo "\t Deleting the vscode-java-test repo from tmp folder"
rm -rf vscode-java-test
echo "\t Getting out of /tmp folder"
popd
echo "vscode-java-test successfully installed"
