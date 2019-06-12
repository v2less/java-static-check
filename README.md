# Java Preflight Analysis

Helper docker image for use in pipeline builds, based on Alpine and OpenJDK.

Tools:
 * Checkstyle
 * PMD

## Usage Checkstyle

Checkstyle example, from within your source directory:

    docker run --rm -it -w /work -v $(pwd):/work sgwilbur/java-preflight-checks:latest checkstyle -c /sun_checks.xml src/main/java/*

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

## Usage PMD

Using PMD from within your

    docker run --rm -it -w /work -v $(pwd):/work sgwilbur/java-preflight-checks:latest pmd -d src/main/java -l java -f xml -rulesets java-quickstart
    WARNING: This analysis could be faster, please consider using Incremental Analysis: https://pmd.github.io/pmd-6.15.0/pmd_userdocs_incremental_analysis.html
    <?xml version="1.0" encoding="UTF-8"?>
    <pmd xmlns="http://pmd.sourceforge.net/report/2.0.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://pmd.sourceforge.net/report/2.0.0 http://pmd.sourceforge.net/report_2_0_0.xsd"
        version="6.15.0" timestamp="2019-06-12T13:31:08.740">
    <file name="/work/src/main/java/com/mycompany/app/App.java">
    <violation beginline="8" endline="13" begincolumn="1" endcolumn="1" rule="UseUtilityClass" ruleset="Design" package="com.mycompany.app" class="App" externalInfoUrl="https://pmd.github.io/pmd/pmd_rules_java_design.html#useutilityclass" priority="3">
    All methods are static.  Consider using a utility class instead. Alternatively, you could add a private constructor or make the class abstract to silence this warning.
    </violation>
    </file>
    </pmd>


## Reference

 * [Checkstyle](http://checkstyle.sourceforge.net/)
 * [Checkstyle Releases](https://github.com/checkstyle/checkstyle/releases/)
