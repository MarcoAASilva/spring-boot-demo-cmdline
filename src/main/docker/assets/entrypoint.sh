echo configuring demo-cmdline from package $BIN_PACKAGE_PREFIX...
	
unzip -o /tmp/$BIN_PACKAGE_PREFIX-bin.zip -d ~
chmod a+x ~/$BIN_PACKAGE_PREFIX/bin/demo-cmdline.sh

/bin/sh ~/$BIN_PACKAGE_PREFIX/bin/demo-cmdline.sh

echo sleeping for $POST_EXEC_SLEEP_INTERVAL s...
sleep $POST_EXEC_SLEEP_INTERVAL