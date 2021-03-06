# damn Linux/Windows line endings

# OS specific support (must be 'true' or 'false').
cygwin=false;
darwin=false;
case "`uname`" in
	CYGWIN*)
		cygwin=true
		;;

	Darwin*)
		darwin=true
		;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
	[ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Attempt to find JAVA_HOME if not already set
if [ -z "${JAVA_HOME}" ]; then
	if $darwin ; then
		[ -z "$JAVA_HOME" -a -f "/usr/libexec/java_home" ] && export JAVA_HOME=`/usr/libexec/java_home`
		[ -z "$JAVA_HOME" -a -d "/Library/Java/Home" ] && export JAVA_HOME="/Library/Java/Home"
		[ -z "$JAVA_HOME" -a -d "/System/Library/Frameworks/JavaVM.framework/Home" ] && export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
	else
		javaExecutable="`which javac`"
		[ -z "$javaExecutable" -o "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ] && echo "JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME." && exit 1
		# readlink(1) is not available as standard on Solaris 10.
		readLink=`which readlink`
		[ `expr "$readLink" : '\([^ ]*\)'` = "no" ] && echo "JAVA_HOME not set and readlink not available, please set JAVA_HOME." && exit 1
		javaExecutable="`readlink -f \"$javaExecutable\"`"
		javaHome="`dirname \"$javaExecutable\"`"
		javaHome=`expr "$javaHome" : '\(.*\)/bin'`
		JAVA_HOME="$javaHome"
		export JAVA_HOME
	fi
fi

# Sanity check that we have java
if [ ! -f "${JAVA_HOME}/bin/java" ]; then
	echo ""
	echo "======================================================================================================"
	echo " Please ensure that your JAVA_HOME points to a valid Java SDK."
	echo " You are currently pointing to:"
	echo ""
	echo "  ${JAVA_HOME}"
	echo ""
	echo " This does not seem to be valid. Please rectify and restart."
	echo "======================================================================================================"
	echo ""
	exit 1
fi

# Attempt to find CMDLINE_HOME if not already set
if [ -z "${CMDLINE_HOME}" ]; then
    # Resolve links: $0 may be a link
    PRG="$0"
    # Need this for relative symlinks.
    while [ -h "$PRG" ] ; do
	    ls=`ls -ld "$PRG"`
	    link=`expr "$ls" : '.*-> \(.*\)$'`
	    if expr "$link" : '/.*' > /dev/null; then
		    PRG="$link"
	    else
		    PRG=`dirname "$PRG"`"/$link"
	    fi
    done
    SAVED="`pwd`"
    cd "`dirname \"$PRG\"`/../" >&-
    export CMDLINE_HOME="`pwd -P`"
    cd "$SAVED" >&-
fi

if [ ! -d "${CMDLINE_HOME}" ]; then
	echo "Not a directory: CMDLINE_HOME=${CMDLINE_HOME}"
	echo "Please rectify and restart."
	exit 2
fi

CLASSPATH=.:${CMDLINE_HOME}/bin
if [ -d ${CMDLINE_HOME}/ext ]; then
	CLASSPATH=$CLASSPATH:${CMDLINE_HOME}/ext
fi
for f in ${CMDLINE_HOME}/lib/*; do
	CLASSPATH=$CLASSPATH:$f
done

if $cygwin; then
	CMDLINE_HOME=`cygpath --path --mixed "$CMDLINE_HOME"`
	CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
fi

"${JAVA_HOME}/bin/java" ${JAVA_OPTS} -jar $CMDLINE_HOME/lib/demo-cmdline.jar "$@"
