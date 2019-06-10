# Java Preflight Analysis

Helper docker image for use in pipeline builds.

Tools:
 * Checkstyle
 *

## Usage


Checkstyle example, from within your source directory:

    docker run --rm -it -w /work -v $(pwd):/work sgwilbur/java-preflight-analysis:0.0.12 checkstyle -c /sun_checks.xml src/main/java/*

    Starting audit...
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:1: Missing package-info.java file. [JavadocPackage]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:7: Line has trailing spaces. [RegexpSingleline]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:7:1: Utility classes should not have a public or default constructor. [HideUtilityClassConstructor]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:8:1: '{' at column 1 should be on the previous line. [LeftCurly]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:9:5: Missing a Javadoc comment. [MissingJavadocMethod]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:9:28: '(' is followed by whitespace. [ParenPad]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:9:30: Parameter args should be final. [FinalParameters]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:9:44: ')' is preceded with whitespace. [ParenPad]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:10:5: '{' at column 5 should be on the previous line. [LeftCurly]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:11:27: '(' is followed by whitespace. [ParenPad]
    [ERROR] /work/src/main/java/com/mycompany/app/App.java:11:44: ')' is preceded with whitespace. [ParenPad]
    Audit done.
    Checkstyle ends with 11 errors.

    # second iteration
    docker run -it -w /work -v $(pwd):/work 576 checkstyle.sh -c /sun_checks.xml src/main/java



##
