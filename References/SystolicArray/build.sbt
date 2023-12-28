name := "simd"

version := "1.0"

scalaVersion := "2.12.10"

libraryDependencies ++= Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.5.6",
  "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.6",
  "edu.berkeley.cs" %% "chiseltest" % "0.5.6" % "test",
  "org.scalatest" %% "scalatest" % "3.1.4" % "test"
)

scalacOptions ++= Seq("-Xsource:2.11")

javacOptions ++= Seq("-source", "1.8", "-target", "1.8")

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.6" cross CrossVersion.full)
